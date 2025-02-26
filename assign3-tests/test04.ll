; ModuleID = 'test04.bc'
source_filename = "test04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %name0, i32 %name1) #0 !dbg !9 {
  call void @llvm.dbg.value(metadata i32 %name0, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %name1, metadata !15, metadata !DIExpression()), !dbg !14
  %name2 = add nsw i32 %name0, %name1, !dbg !16
  ret i32 %name2, !dbg !17
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %name6, i32 %name7) #0 !dbg !18 {
  call void @llvm.dbg.value(metadata i32 %name6, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.value(metadata i32 %name7, metadata !21, metadata !DIExpression()), !dbg !20
  %name8 = sub nsw i32 %name6, %name7, !dbg !22
  ret i32 %name8, !dbg !23
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 %name9, i32 %name10, i32 (i32, i32)* %name11) #0 !dbg !24 {
  call void @llvm.dbg.value(metadata i32 %name9, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 %name10, metadata !30, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name11, metadata !31, metadata !DIExpression()), !dbg !29
  %name12 = call i32 %name11(i32 %name9, i32 %name10), !dbg !32
  ret i32 %name12, !dbg !33
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %name13) #0 !dbg !34 {
  call void @llvm.dbg.value(metadata i32 %name13, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !39, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !40, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !41, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !42, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !43, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32, i32 (i32, i32)*)* @foo, metadata !44, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 1, metadata !46, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 2, metadata !47, metadata !DIExpression()), !dbg !38
  %name14 = icmp sge i32 %name13, 4, !dbg !48
  br i1 %name14, label %1, label %2, !dbg !50

1:                                                ; preds = %0
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !41, metadata !DIExpression()), !dbg !38
  br label %2, !dbg !51

2:                                                ; preds = %1, %0
  %.01 = phi i32 (i32, i32)* [ @minus, %1 ], [ null, %0 ], !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.01, metadata !41, metadata !DIExpression()), !dbg !38
  %name15 = call i32 @foo(i32 1, i32 2, i32 (i32, i32)* %.01), !dbg !53
  %name16 = icmp sge i32 %name13, 5, !dbg !54
  br i1 %name16, label %3, label %4, !dbg !56

3:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !41, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !42, metadata !DIExpression()), !dbg !38
  br label %4, !dbg !57

4:                                                ; preds = %3, %2
  %.1 = phi i32 (i32, i32)* [ @plus, %3 ], [ %.01, %2 ], !dbg !38
  %.0 = phi i32 (i32, i32)* [ @plus, %3 ], [ null, %2 ], !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.0, metadata !42, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.1, metadata !41, metadata !DIExpression()), !dbg !38
  %name17 = icmp ne i32 (i32, i32)* %.1, null, !dbg !59
  br i1 %name17, label %5, label %6, !dbg !61

5:                                                ; preds = %4
  %name18 = call i32 @foo(i32 1, i32 2, i32 (i32, i32)* %.0), !dbg !62
  call void @llvm.dbg.value(metadata i32 %name18, metadata !64, metadata !DIExpression()), !dbg !66
  br label %6, !dbg !67

6:                                                ; preds = %5, %4
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test04.c", directory: "/home/free/workspace/compiler/assign3/assign3-tests")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.0-4ubuntu1 "}
!9 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 2, type: !10, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 2, type: !12)
!14 = !DILocation(line: 0, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 2, type: !12)
!16 = !DILocation(line: 3, column: 12, scope: !9)
!17 = !DILocation(line: 3, column: 4, scope: !9)
!18 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !10, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 6, type: !12)
!20 = !DILocation(line: 0, scope: !18)
!21 = !DILocalVariable(name: "b", arg: 2, scope: !18, file: !1, line: 6, type: !12)
!22 = !DILocation(line: 7, column: 12, scope: !18)
!23 = !DILocation(line: 7, column: 4, scope: !18)
!24 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 9, type: !25, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!12, !12, !12, !27}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!28 = !DILocalVariable(name: "a", arg: 1, scope: !24, file: !1, line: 9, type: !12)
!29 = !DILocation(line: 0, scope: !24)
!30 = !DILocalVariable(name: "b", arg: 2, scope: !24, file: !1, line: 9, type: !12)
!31 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !24, file: !1, line: 9, type: !27)
!32 = !DILocation(line: 10, column: 12, scope: !24)
!33 = !DILocation(line: 10, column: 5, scope: !24)
!34 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 13, type: !35, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!12, !12}
!37 = !DILocalVariable(name: "x", arg: 1, scope: !34, file: !1, line: 13, type: !12)
!38 = !DILocation(line: 0, scope: !34)
!39 = !DILocalVariable(name: "a_fptr", scope: !34, file: !1, line: 14, type: !27)
!40 = !DILocalVariable(name: "s_fptr", scope: !34, file: !1, line: 15, type: !27)
!41 = !DILocalVariable(name: "t_fptr", scope: !34, file: !1, line: 16, type: !27)
!42 = !DILocalVariable(name: "q_fptr", scope: !34, file: !1, line: 17, type: !27)
!43 = !DILocalVariable(name: "r_fptr", scope: !34, file: !1, line: 18, type: !27)
!44 = !DILocalVariable(name: "af_ptr", scope: !34, file: !1, line: 19, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!46 = !DILocalVariable(name: "op1", scope: !34, file: !1, line: 21, type: !12)
!47 = !DILocalVariable(name: "op2", scope: !34, file: !1, line: 21, type: !12)
!48 = !DILocation(line: 23, column: 11, scope: !49)
!49 = distinct !DILexicalBlock(scope: !34, file: !1, line: 23, column: 9)
!50 = !DILocation(line: 23, column: 9, scope: !34)
!51 = !DILocation(line: 25, column: 5, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !1, line: 23, column: 17)
!53 = !DILocation(line: 26, column: 5, scope: !34)
!54 = !DILocation(line: 27, column: 11, scope: !55)
!55 = distinct !DILexicalBlock(scope: !34, file: !1, line: 27, column: 9)
!56 = !DILocation(line: 27, column: 9, scope: !34)
!57 = !DILocation(line: 30, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !1, line: 27, column: 17)
!59 = !DILocation(line: 32, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !34, file: !1, line: 32, column: 9)
!61 = !DILocation(line: 32, column: 9, scope: !34)
!62 = !DILocation(line: 33, column: 26, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !1, line: 32, column: 25)
!64 = !DILocalVariable(name: "result", scope: !63, file: !1, line: 33, type: !65)
!65 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!66 = !DILocation(line: 0, scope: !63)
!67 = !DILocation(line: 34, column: 5, scope: !63)
!68 = !DILocation(line: 35, column: 4, scope: !34)
