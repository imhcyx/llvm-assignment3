; ModuleID = 'test15.bc'
source_filename = "test15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %name0, i32 %name1) #0 !dbg !7 {
  call void @llvm.dbg.value(metadata i32 %name0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %name1, metadata !13, metadata !DIExpression()), !dbg !12
  %name2 = add nsw i32 %name0, %name1, !dbg !14
  ret i32 %name2, !dbg !15
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %name6, i32 %name7) #0 !dbg !16 {
  call void @llvm.dbg.value(metadata i32 %name6, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 %name7, metadata !19, metadata !DIExpression()), !dbg !18
  %name8 = sub nsw i32 %name6, %name7, !dbg !20
  ret i32 %name8, !dbg !21
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 %name9, i32 %name10, i32 (i32, i32)* %name11, i32 (i32, i32)* %name12) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %name9, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 %name10, metadata !28, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name11, metadata !29, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name12, metadata !30, metadata !DIExpression()), !dbg !27
  %name13 = icmp sgt i32 %name9, 0, !dbg !31
  br i1 %name13, label %1, label %2, !dbg !33

1:                                                ; preds = %0
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name11, metadata !34, metadata !DIExpression()), !dbg !27
  br label %3, !dbg !35

2:                                                ; preds = %0
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name12, metadata !34, metadata !DIExpression()), !dbg !27
  br label %3

3:                                                ; preds = %2, %1
  %.0 = phi i32 (i32, i32)* [ %name11, %1 ], [ %name12, %2 ], !dbg !36
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.0, metadata !34, metadata !DIExpression()), !dbg !27
  %name14 = call i32 %.0(i32 %name9, i32 %name10), !dbg !37
  ret i32 %name14, !dbg !38
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %name15, i32 %name16, i32 (i32, i32)* %name17, i32 (i32, i32)* %name18) #0 !dbg !39 {
  call void @llvm.dbg.value(metadata i32 %name15, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i32 %name16, metadata !42, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name17, metadata !43, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name18, metadata !44, metadata !DIExpression()), !dbg !41
  %name19 = call i32 @foo(i32 %name15, i32 %name16, i32 (i32, i32)* %name17, i32 (i32, i32)* %name18), !dbg !45
  ret i32 %name19, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %name20, i32 %name21, i32 %name22) #0 !dbg !47 {
  call void @llvm.dbg.value(metadata i8 %name20, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 %name21, metadata !53, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 %name22, metadata !54, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !55, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !56, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !57, metadata !DIExpression()), !dbg !52
  %name23 = sext i8 %name20 to i32, !dbg !58
  %name24 = icmp eq i32 %name23, 43, !dbg !60
  br i1 %name24, label %1, label %2, !dbg !61

1:                                                ; preds = %0
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !57, metadata !DIExpression()), !dbg !52
  br label %5, !dbg !62

2:                                                ; preds = %0
  %name25 = sext i8 %name20 to i32, !dbg !64
  %name26 = icmp eq i32 %name25, 45, !dbg !66
  br i1 %name26, label %3, label %4, !dbg !67

3:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !57, metadata !DIExpression()), !dbg !52
  br label %4, !dbg !68

4:                                                ; preds = %3, %2
  %.0 = phi i32 (i32, i32)* [ @minus, %3 ], [ null, %2 ], !dbg !52
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.0, metadata !57, metadata !DIExpression()), !dbg !52
  br label %5

5:                                                ; preds = %4, %1
  %.1 = phi i32 (i32, i32)* [ @plus, %1 ], [ %.0, %4 ], !dbg !70
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.1, metadata !57, metadata !DIExpression()), !dbg !52
  %name27 = call i32 @clever(i32 %name21, i32 %name22, i32 (i32, i32)* @plus, i32 (i32, i32)* %.1), !dbg !71
  call void @llvm.dbg.value(metadata i32 %name27, metadata !72, metadata !DIExpression()), !dbg !52
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test15.c", directory: "/home/free/workspace/compiler/assign3/assign3-tests")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0-4ubuntu1 "}
!7 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 1, type: !10)
!14 = !DILocation(line: 2, column: 12, scope: !7)
!15 = !DILocation(line: 2, column: 4, scope: !7)
!16 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 5, type: !10)
!20 = !DILocation(line: 6, column: 12, scope: !16)
!21 = !DILocation(line: 6, column: 4, scope: !16)
!22 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 9, type: !23, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!10, !10, !10, !25, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!26 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 9, type: !10)
!27 = !DILocation(line: 0, scope: !22)
!28 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 9, type: !10)
!29 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !22, file: !1, line: 9, type: !25)
!30 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !22, file: !1, line: 9, type: !25)
!31 = !DILocation(line: 11, column: 10, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !1, line: 11, column: 8)
!33 = !DILocation(line: 11, column: 8, scope: !22)
!34 = !DILocalVariable(name: "s_fptr", scope: !22, file: !1, line: 10, type: !25)
!35 = !DILocation(line: 12, column: 7, scope: !32)
!36 = !DILocation(line: 0, scope: !32)
!37 = !DILocation(line: 15, column: 11, scope: !22)
!38 = !DILocation(line: 15, column: 4, scope: !22)
!39 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 18, type: !23, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "a", arg: 1, scope: !39, file: !1, line: 18, type: !10)
!41 = !DILocation(line: 0, scope: !39)
!42 = !DILocalVariable(name: "b", arg: 2, scope: !39, file: !1, line: 18, type: !10)
!43 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !39, file: !1, line: 18, type: !25)
!44 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !39, file: !1, line: 18, type: !25)
!45 = !DILocation(line: 19, column: 12, scope: !39)
!46 = !DILocation(line: 19, column: 5, scope: !39)
!47 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 23, type: !48, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!10, !50, !10, !10}
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "x", arg: 1, scope: !47, file: !1, line: 23, type: !50)
!52 = !DILocation(line: 0, scope: !47)
!53 = !DILocalVariable(name: "op1", arg: 2, scope: !47, file: !1, line: 23, type: !10)
!54 = !DILocalVariable(name: "op2", arg: 3, scope: !47, file: !1, line: 23, type: !10)
!55 = !DILocalVariable(name: "a_fptr", scope: !47, file: !1, line: 24, type: !25)
!56 = !DILocalVariable(name: "s_fptr", scope: !47, file: !1, line: 25, type: !25)
!57 = !DILocalVariable(name: "t_fptr", scope: !47, file: !1, line: 26, type: !25)
!58 = !DILocation(line: 28, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !47, file: !1, line: 28, column: 9)
!60 = !DILocation(line: 28, column: 11, scope: !59)
!61 = !DILocation(line: 28, column: 9, scope: !47)
!62 = !DILocation(line: 30, column: 5, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 28, column: 19)
!64 = !DILocation(line: 31, column: 14, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !1, line: 31, column: 14)
!66 = !DILocation(line: 31, column: 16, scope: !65)
!67 = !DILocation(line: 31, column: 14, scope: !59)
!68 = !DILocation(line: 33, column: 5, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !1, line: 31, column: 24)
!70 = !DILocation(line: 0, scope: !59)
!71 = !DILocation(line: 35, column: 23, scope: !47)
!72 = !DILocalVariable(name: "result", scope: !47, file: !1, line: 35, type: !73)
!73 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!74 = !DILocation(line: 36, column: 5, scope: !47)
