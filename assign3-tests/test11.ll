; ModuleID = 'test11.bc'
source_filename = "test11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %name0, i32 %name1) #0 !dbg !13 {
  call void @llvm.dbg.value(metadata i32 %name0, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %name1, metadata !16, metadata !DIExpression()), !dbg !15
  %name2 = add nsw i32 %name0, %name1, !dbg !17
  ret i32 %name2, !dbg !18
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %name6, i32 %name7) #0 !dbg !19 {
  call void @llvm.dbg.value(metadata i32 %name6, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 %name7, metadata !22, metadata !DIExpression()), !dbg !21
  %name8 = sub nsw i32 %name6, %name7, !dbg !23
  ret i32 %name8, !dbg !24
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %name9, i32 %name10, i32 (i32, i32)* %name11) #0 !dbg !25 {
  call void @llvm.dbg.value(metadata i32 %name9, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 %name10, metadata !30, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name11, metadata !31, metadata !DIExpression()), !dbg !29
  %name12 = call i32 %name11(i32 %name9, i32 %name10), !dbg !32
  ret i32 %name12, !dbg !33
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %name13, i32 %name14, i32 %name15) #0 !dbg !34 {
  call void @llvm.dbg.value(metadata i8 %name13, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 %name14, metadata !40, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 %name15, metadata !41, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !42, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !43, metadata !DIExpression()), !dbg !39
  %name16 = call noalias i8* @malloc(i64 8) #3, !dbg !44
  %name17 = bitcast i8* %name16 to i32 (i32, i32)**, !dbg !45
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %name17, metadata !46, metadata !DIExpression()), !dbg !39
  %name18 = sext i8 %name13 to i32, !dbg !47
  %name19 = icmp eq i32 %name18, 43, !dbg !49
  br i1 %name19, label %1, label %2, !dbg !50

1:                                                ; preds = %0
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %name17, align 8, !dbg !51
  br label %2, !dbg !53

2:                                                ; preds = %1, %0
  %name20 = sext i8 %name13 to i32, !dbg !54
  %name21 = icmp eq i32 %name20, 45, !dbg !56
  br i1 %name21, label %3, label %4, !dbg !57

3:                                                ; preds = %2
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %name17, align 8, !dbg !58
  br label %4, !dbg !60

4:                                                ; preds = %3, %2
  %name22 = load i32 (i32, i32)*, i32 (i32, i32)** %name17, align 8, !dbg !61
  %name23 = call i32 @clever(i32 %name14, i32 %name15, i32 (i32, i32)* %name22), !dbg !62
  call void @llvm.dbg.value(metadata i32 %name23, metadata !63, metadata !DIExpression()), !dbg !39
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test11.c", directory: "/home/free/workspace/compiler/assign3/assign3-tests")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DISubroutineType(types: !7)
!7 = !{!8, !8, !8}
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 10.0.0-4ubuntu1 "}
!13 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 2, type: !6, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !13, file: !1, line: 2, type: !8)
!15 = !DILocation(line: 0, scope: !13)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !13, file: !1, line: 2, type: !8)
!17 = !DILocation(line: 3, column: 12, scope: !13)
!18 = !DILocation(line: 3, column: 4, scope: !13)
!19 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !6, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 6, type: !8)
!21 = !DILocation(line: 0, scope: !19)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 6, type: !8)
!23 = !DILocation(line: 7, column: 12, scope: !19)
!24 = !DILocation(line: 7, column: 4, scope: !19)
!25 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 10, type: !26, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!8, !8, !8, !5}
!28 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !1, line: 10, type: !8)
!29 = !DILocation(line: 0, scope: !25)
!30 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !1, line: 10, type: !8)
!31 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !25, file: !1, line: 10, type: !5)
!32 = !DILocation(line: 11, column: 12, scope: !25)
!33 = !DILocation(line: 11, column: 5, scope: !25)
!34 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 15, type: !35, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!8, !37, !8, !8}
!37 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!38 = !DILocalVariable(name: "x", arg: 1, scope: !34, file: !1, line: 15, type: !37)
!39 = !DILocation(line: 0, scope: !34)
!40 = !DILocalVariable(name: "op1", arg: 2, scope: !34, file: !1, line: 15, type: !8)
!41 = !DILocalVariable(name: "op2", arg: 3, scope: !34, file: !1, line: 15, type: !8)
!42 = !DILocalVariable(name: "a_fptr", scope: !34, file: !1, line: 16, type: !5)
!43 = !DILocalVariable(name: "s_fptr", scope: !34, file: !1, line: 17, type: !5)
!44 = !DILocation(line: 18, column: 52, scope: !34)
!45 = !DILocation(line: 18, column: 32, scope: !34)
!46 = !DILocalVariable(name: "t_fptr", scope: !34, file: !1, line: 18, type: !4)
!47 = !DILocation(line: 20, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !1, line: 20, column: 9)
!49 = !DILocation(line: 20, column: 11, scope: !48)
!50 = !DILocation(line: 20, column: 9, scope: !34)
!51 = !DILocation(line: 21, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 20, column: 19)
!53 = !DILocation(line: 22, column: 5, scope: !52)
!54 = !DILocation(line: 23, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !34, file: !1, line: 23, column: 9)
!56 = !DILocation(line: 23, column: 11, scope: !55)
!57 = !DILocation(line: 23, column: 9, scope: !34)
!58 = !DILocation(line: 24, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !1, line: 23, column: 19)
!60 = !DILocation(line: 25, column: 5, scope: !59)
!61 = !DILocation(line: 27, column: 40, scope: !34)
!62 = !DILocation(line: 27, column: 23, scope: !34)
!63 = !DILocalVariable(name: "result", scope: !34, file: !1, line: 27, type: !64)
!64 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!65 = !DILocation(line: 28, column: 5, scope: !34)
