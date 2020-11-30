; ModuleID = 'test17.bc'
source_filename = "test17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }

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
define dso_local i32 (i32, i32)* @foo(i32 %name9, i32 %name10, i32 (i32, i32)* %name11, i32 (i32, i32)* %name12) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %name9, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 %name10, metadata !28, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name11, metadata !29, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name12, metadata !30, metadata !DIExpression()), !dbg !27
  ret i32 (i32, i32)* %name12, !dbg !31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %name13, i32 %name14, i32 (i32, i32)* %name15, i32 (i32, i32)* %name16) #0 !dbg !32 {
  %name17 = alloca %struct.fptr, align 8
  %name18 = getelementptr inbounds %struct.fptr, %struct.fptr* %name17, i32 0, i32 0
  store i32 (i32, i32)* %name16, i32 (i32, i32)** %name18, align 8
  call void @llvm.dbg.value(metadata i32 %name13, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 %name14, metadata !40, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name15, metadata !41, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata %struct.fptr* %name17, metadata !42, metadata !DIExpression()), !dbg !43
  %name19 = getelementptr inbounds %struct.fptr, %struct.fptr* %name17, i32 0, i32 0, !dbg !44
  %name20 = load i32 (i32, i32)*, i32 (i32, i32)** %name19, align 8, !dbg !44
  %name21 = call i32 (i32, i32)* @foo(i32 %name13, i32 %name14, i32 (i32, i32)* %name15, i32 (i32, i32)* %name20), !dbg !45
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name21, metadata !46, metadata !DIExpression()), !dbg !39
  %name22 = call i32 %name21(i32 %name13, i32 %name14), !dbg !47
  ret i32 %name22, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %name23, i32 %name24, i32 %name25) #0 !dbg !49 {
  %name26 = alloca %struct.fptr, align 8
  call void @llvm.dbg.value(metadata i8 %name23, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %name24, metadata !55, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %name25, metadata !56, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !57, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !58, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata %struct.fptr* %name26, metadata !59, metadata !DIExpression()), !dbg !60
  %name27 = bitcast %struct.fptr* %name26 to i8*, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 8 %name27, i8 0, i64 8, i1 false), !dbg !60
  %name28 = sext i8 %name23 to i32, !dbg !61
  %name29 = icmp eq i32 %name28, 43, !dbg !63
  br i1 %name29, label %1, label %2, !dbg !64

1:                                                ; preds = %0
  %name30 = getelementptr inbounds %struct.fptr, %struct.fptr* %name26, i32 0, i32 0, !dbg !65
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %name30, align 8, !dbg !67
  br label %5, !dbg !68

2:                                                ; preds = %0
  %name31 = sext i8 %name23 to i32, !dbg !69
  %name32 = icmp eq i32 %name31, 45, !dbg !71
  br i1 %name32, label %3, label %4, !dbg !72

3:                                                ; preds = %2
  %name33 = getelementptr inbounds %struct.fptr, %struct.fptr* %name26, i32 0, i32 0, !dbg !73
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %name33, align 8, !dbg !75
  br label %4, !dbg !76

4:                                                ; preds = %3, %2
  br label %5

5:                                                ; preds = %4, %1
  %name34 = getelementptr inbounds %struct.fptr, %struct.fptr* %name26, i32 0, i32 0, !dbg !77
  %name35 = load i32 (i32, i32)*, i32 (i32, i32)** %name34, align 8, !dbg !77
  %name36 = call i32 @clever(i32 %name24, i32 %name25, i32 (i32, i32)* @plus, i32 (i32, i32)* %name35), !dbg !77
  call void @llvm.dbg.value(metadata i32 %name36, metadata !78, metadata !DIExpression()), !dbg !54
  ret i32 0, !dbg !80
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test17.c", directory: "/home/free/workspace/compiler/assign3/assign3-tests")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0-4ubuntu1 "}
!7 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 6, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 6, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 6, type: !10)
!14 = !DILocation(line: 7, column: 12, scope: !7)
!15 = !DILocation(line: 7, column: 4, scope: !7)
!16 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 10, type: !8, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 10, type: !10)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 10, type: !10)
!20 = !DILocation(line: 11, column: 12, scope: !16)
!21 = !DILocation(line: 11, column: 4, scope: !16)
!22 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 14, type: !23, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !10, !10, !25, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!26 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 14, type: !10)
!27 = !DILocation(line: 0, scope: !22)
!28 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 14, type: !10)
!29 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !22, file: !1, line: 14, type: !25)
!30 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !22, file: !1, line: 14, type: !25)
!31 = !DILocation(line: 15, column: 4, scope: !22)
!32 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 18, type: !33, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!10, !10, !10, !25, !35}
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !36)
!36 = !{!37}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !35, file: !1, line: 4, baseType: !25, size: 64)
!38 = !DILocalVariable(name: "a", arg: 1, scope: !32, file: !1, line: 18, type: !10)
!39 = !DILocation(line: 0, scope: !32)
!40 = !DILocalVariable(name: "b", arg: 2, scope: !32, file: !1, line: 18, type: !10)
!41 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !32, file: !1, line: 18, type: !25)
!42 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !32, file: !1, line: 18, type: !35)
!43 = !DILocation(line: 18, column: 63, scope: !32)
!44 = !DILocation(line: 20, column: 38, scope: !32)
!45 = !DILocation(line: 20, column: 13, scope: !32)
!46 = !DILocalVariable(name: "s_fptr", scope: !32, file: !1, line: 19, type: !25)
!47 = !DILocation(line: 21, column: 11, scope: !32)
!48 = !DILocation(line: 21, column: 4, scope: !32)
!49 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 25, type: !50, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!10, !52, !10, !10}
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "x", arg: 1, scope: !49, file: !1, line: 25, type: !52)
!54 = !DILocation(line: 0, scope: !49)
!55 = !DILocalVariable(name: "op1", arg: 2, scope: !49, file: !1, line: 25, type: !10)
!56 = !DILocalVariable(name: "op2", arg: 3, scope: !49, file: !1, line: 25, type: !10)
!57 = !DILocalVariable(name: "a_fptr", scope: !49, file: !1, line: 26, type: !25)
!58 = !DILocalVariable(name: "s_fptr", scope: !49, file: !1, line: 27, type: !25)
!59 = !DILocalVariable(name: "t_fptr", scope: !49, file: !1, line: 28, type: !35)
!60 = !DILocation(line: 28, column: 17, scope: !49)
!61 = !DILocation(line: 30, column: 9, scope: !62)
!62 = distinct !DILexicalBlock(scope: !49, file: !1, line: 30, column: 9)
!63 = !DILocation(line: 30, column: 11, scope: !62)
!64 = !DILocation(line: 30, column: 9, scope: !49)
!65 = !DILocation(line: 31, column: 15, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !1, line: 30, column: 19)
!67 = !DILocation(line: 31, column: 22, scope: !66)
!68 = !DILocation(line: 32, column: 5, scope: !66)
!69 = !DILocation(line: 33, column: 14, scope: !70)
!70 = distinct !DILexicalBlock(scope: !62, file: !1, line: 33, column: 14)
!71 = !DILocation(line: 33, column: 16, scope: !70)
!72 = !DILocation(line: 33, column: 14, scope: !62)
!73 = !DILocation(line: 34, column: 15, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !1, line: 33, column: 24)
!75 = !DILocation(line: 34, column: 22, scope: !74)
!76 = !DILocation(line: 35, column: 5, scope: !74)
!77 = !DILocation(line: 37, column: 23, scope: !49)
!78 = !DILocalVariable(name: "result", scope: !49, file: !1, line: 37, type: !79)
!79 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!80 = !DILocation(line: 38, column: 5, scope: !49)
