//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#include <llvm/Support/CommandLine.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/Support/ToolOutputFile.h>

#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/Bitcode/BitcodeWriter.h>


#include <llvm/Transforms/Utils.h>
#include <llvm/Transforms/Scalar.h>

#include <llvm/IR/Function.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/CFG.h>
#include <llvm/Pass.h>
#include <llvm/Support/raw_ostream.h>

#include "Dataflow.h"

using namespace llvm;

// (pointer, offset)
struct PointerTy : std::pair<Value*, int64_t> {
    PointerTy(Value *val, int64_t off) : pair(val, off) {}
    PointerTy(Value *val) : pair(val, 0) {}
};

// key -> {pointees}
// (callinst, -1) is specially used to store possible callees
// (function, -1) is specially used to store return values
typedef std::map<PointerTy, std::set<PointerTy>> PointerMap;

inline raw_ostream &operator<<(raw_ostream &out, const PointerMap &info) {
    for (auto it : info) {
        Value *ptr = it.first.first;
        int64_t offset = it.first.second;
        if (ptr) {
            out << ptr->getName();
        }
        else {
            out << "???";
        }
        out << "[" << offset << "]: ";
        bool first = true;
        for (auto p : it.second) {
            if (first) {
                first = false;
            }
            else {
                out << ", ";
            }
            if (p.first) {
                out << p.first->getName();
            }
            else {
                out << "???";
            }
            out << "[" << p.second << "]";
        }
        out << '\n';
    }
    return out;
}

void copyUse(PointerMap &dstmap, const PointerTy dst, const PointerMap &srcmap, const PointerTy src) {
    if (isa<Function>(src.first) && src.second >= 0) {
        dstmap[dst].insert(src);
    }
    else if (srcmap.find(src) != srcmap.end()) {
        auto &set = srcmap.at(src);
        dstmap[dst].insert(set.begin(), set.end());
    }
}

void copyUse(PointerMap &map, const PointerTy dst, const PointerTy src) {
    copyUse(map, dst, map, src);
}

void rewriteUse(PointerMap &dstmap, const PointerTy dst, const PointerMap &srcmap, const PointerTy src) {
    if (isa<Function>(src.first) && src.second >= 0) {
        dstmap[dst].insert(src);
    }
    else if (srcmap.find(src) != srcmap.end()) {
        dstmap[dst] = srcmap.at(src);
    }
}

void rewriteUse(PointerMap &map, const PointerTy dst, const PointerTy src) {
    rewriteUse(map, dst, map, src);
}

class PointerVisitor : public DataflowVisitor<PointerMap> {
public:
    PointerVisitor() {}
    void merge(PointerMap *dest, const PointerMap &src) override {
        for (auto it : src) {
            copyUse(*dest, it.first, src, it.first);
        }
    }

    void compDFVal(Instruction *inst, PointerMap *dfval) override{
        if (isa<DbgInfoIntrinsic>(inst)) return;

        PointerMap &map = *dfval;
        if (PHINode *phi = dyn_cast<PHINode>(inst)) {
            if (phi->getType()->isPointerTy()) {
                for (int i = 0; i < phi->getNumIncomingValues(); i++) {
                    copyUse(map, phi, phi->getIncomingValue(i));
                }
            }
        }
        else if (LoadInst *load = dyn_cast<LoadInst>(inst)) {
            if (load->getType()->isPointerTy()) {
                Value *ptr = load->getPointerOperand();
                for (PointerTy v : map[ptr]) {
                    copyUse(map, load, v);
                }
            }
        }
        else if (StoreInst *store = dyn_cast<StoreInst>(inst)) {
            if (store->getValueOperand()->getType()->isPointerTy()) {
                Value *ptr = store->getPointerOperand();
                for (PointerTy v : map[ptr]) {
                    rewriteUse(map, v, store->getValueOperand());
                }
            }
        }
        else if (GetElementPtrInst *get = dyn_cast<GetElementPtrInst>(inst)) {
            if (get->getPointerOperandType()->isPointerTy()) {
                Value *ptr = get->getPointerOperand();
                Value *idx = get->getOperand(1);
                int64_t offset = dyn_cast<ConstantInt>(idx)->getSExtValue();
                //errs() << "offset: " << offset << '\n';
                map[get].insert(PointerTy(ptr, offset));
            }
        }
        else if (CastInst *cast = dyn_cast<CastInst>(inst)) {
            // TODO
        }
        else if (AllocaInst *alloca = dyn_cast<AllocaInst>(inst)) {
            // TODO
        }
        else if (CallInst *call = dyn_cast<CallInst>(inst)) {
            Value *callee = call->getCalledOperand();
            std::set<PointerTy> singleCallee = {dyn_cast<Function>(callee)}, *callees;
            if (isa<Function>(callee)) {
                callees = &singleCallee;
            }
            else {
                callees = &map[callee];
            }
            for (PointerTy p : *callees) {
                Function *f = dyn_cast<Function>(p.first);
                if (!f) continue;
                DataflowResult<PointerMap>::Type subres;
                PointerMap initval;
                // Ignore LLVM intrinsics
                if (f->getName().startswith("llvm.")) continue;
                // Store callee in a special way
                map[PointerTy(call, -1)].insert(f);
                // Ignore declaration
                if (f->isDeclaration()) continue;
                // Copy arguments
                for (unsigned int i = 0; i < call->getNumArgOperands(); i++) {
                    Value *arg = call->getArgOperand(i);
                    if (arg->getType()->isPointerTy()) {
                        copyUse(initval, f->getArg(i), map, arg);
                    }
                }
                // Compute dataflow for called function
                compForwardDataflow<PointerMap>(f, this, &subres, initval);
                // Copy return value
                if (call->getType()->isPointerTy()) {
                    for (BasicBlock &BB : *f) {
                        copyUse(map, call, subres[&BB].second, PointerTy(f, -1));
                    }
                }
                // Merge callee context values
                for (BasicBlock &BB : *f) {
                    for (auto it : subres[&BB].second) {
                        // callees
                        if (isa<CallInst>(it.first.first) && it.first.second == -1) {
                            map[it.first].insert(it.second.begin(), it.second.end());
                        }
                    }
                }
            }
        }
        else if (ReturnInst *ret = dyn_cast<ReturnInst>(inst)) {
            if (ret->getReturnValue() && ret->getReturnValue()->getType()->isPointerTy()) {
                // Use (function, -1) as key to store return value
                copyUse(map, PointerTy(ret->getFunction(), -1), ret->getReturnValue());
            }
        }
    }
};

static ManagedStatic<LLVMContext> GlobalContext;
static LLVMContext &getGlobalContext() { return *GlobalContext; }

// Name unnamed values for debug purpose
struct NameAnonymousValuePass : public ModulePass {
  static char ID; // Pass identification, replacement for typeid
  NameAnonymousValuePass() : ModulePass(ID) {}

  bool runOnModule(Module &M) override {
    for (Function &F : M) {
      processFunction(F);
    }
    return false;
  }

private:
  unsigned int mNumber = 0;

  void checkAndNameValue(Value &v) {
    if (!v.hasName() && !v.getType()->isVoidTy()) {
      v.setName("name" + std::to_string(mNumber++));
    }
  }

  void processFunction(Function &F) {
    for (Argument &A : F.args()) {
      checkAndNameValue(A);
    }
    for (BasicBlock &BB : F) {
      for (Instruction &I : BB.getInstList()) {
        checkAndNameValue(I);
      }
    }
  }
};

char NameAnonymousValuePass::ID=0;

struct EnableFunctionOptPass : public FunctionPass {
    static char ID;
    EnableFunctionOptPass() :FunctionPass(ID) {}
    bool runOnFunction(Function & F) override {
        if (F.hasFnAttribute(Attribute::OptimizeNone))
        {
            F.removeFnAttr(Attribute::OptimizeNone);
        }
        return true;
    }
};

char EnableFunctionOptPass::ID = 0;

///!TODO TO BE COMPLETED BY YOU FOR ASSIGNMENT 3
struct FuncPtrPass : public ModulePass {
    static char ID; // Pass identification, replacement for typeid
    FuncPtrPass() : ModulePass(ID) {}

    bool runOnModule(Module &M) override {
        for (Function &F : M) {
            processFunction(F);
        }
        return false;
    }

    void processFunction(Function &F) {
        // Ignore declaration
        if (F.isDeclaration()) return;

        // Ignore llvm intrinsics
        if (F.getName().startswith("llvm.")) return;

        PointerVisitor visitor;
        DataflowResult<PointerMap>::Type result;
        PointerMap initval;
        compForwardDataflow<PointerMap>(&F, &visitor, &result, initval);
        printDataflowResult<PointerMap>(outs(), result);
    }
};


char FuncPtrPass::ID = 0;
static RegisterPass<FuncPtrPass> X("funcptrpass", "Print function call instruction");

struct DumpPass : public ModulePass {
    static char ID; // Pass identification, replacement for typeid
    DumpPass() : ModulePass(ID) {}

    bool runOnModule(Module &M) override {
        outs() << M;
        return false;
    }
};


char DumpPass::ID = 0;

static cl::opt<std::string>
InputFilename(cl::Positional,
              cl::desc("<filename>.bc"),
              cl::init(""));

static cl::opt<bool> DumpLL("dumpll", cl::desc("dump ll only"), cl::init(false));

int main(int argc, char **argv) {
    LLVMContext &Context = getGlobalContext();
    SMDiagnostic Err;
    // Parse the command line to read the Inputfilename
    cl::ParseCommandLineOptions(argc, argv,
                                "FuncPtrPass \n My first LLVM too which does not do much.\n");

    // Load the input module
    std::unique_ptr<Module> M = parseIRFile(InputFilename, Err, Context);
    if (!M) {
        Err.print(argv[0], errs());
        return 1;
    }

    llvm::legacy::PassManager Passes;
#if LLVM_VERSION_MAJOR >= 5
    Passes.add(new EnableFunctionOptPass());
#endif
    ///Transform it to SSA
    Passes.add(llvm::createPromoteMemoryToRegisterPass());

    Passes.add(new NameAnonymousValuePass());

    if (DumpLL) {
        Passes.add(new DumpPass());
    }
    else {
        Passes.add(new FuncPtrPass());
    }

    Passes.run(*M.get());
}
