; ModuleID = 'test02.bc'
source_filename = "test02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }

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
define dso_local i32 @clever(i32 %name9) #0 !dbg !24 {
  %name10 = alloca %struct.fptr, align 8
  call void @llvm.dbg.value(metadata i32 %name9, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !29, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !31, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata %struct.fptr* %name10, metadata !32, metadata !DIExpression()), !dbg !36
  %name11 = bitcast %struct.fptr* %name10 to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 8 %name11, i8 0, i64 8, i1 false), !dbg !36
  call void @llvm.dbg.value(metadata i32 1, metadata !37, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 2, metadata !38, metadata !DIExpression()), !dbg !28
  %name12 = icmp eq i32 %name9, 3, !dbg !39
  br i1 %name12, label %1, label %2, !dbg !41

1:                                                ; preds = %0
  %name13 = getelementptr inbounds %struct.fptr, %struct.fptr* %name10, i32 0, i32 0, !dbg !42
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %name13, align 8, !dbg !44
  br label %3, !dbg !45

2:                                                ; preds = %0
  %name14 = getelementptr inbounds %struct.fptr, %struct.fptr* %name10, i32 0, i32 0, !dbg !46
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %name14, align 8, !dbg !48
  br label %3

3:                                                ; preds = %2, %1
  %name15 = getelementptr inbounds %struct.fptr, %struct.fptr* %name10, i32 0, i32 0, !dbg !49
  %name16 = load i32 (i32, i32)*, i32 (i32, i32)** %name15, align 8, !dbg !49
  %name17 = icmp ne i32 (i32, i32)* %name16, null, !dbg !51
  br i1 %name17, label %4, label %5, !dbg !52

4:                                                ; preds = %3
  %name18 = getelementptr inbounds %struct.fptr, %struct.fptr* %name10, i32 0, i32 0, !dbg !53
  %name19 = load i32 (i32, i32)*, i32 (i32, i32)** %name18, align 8, !dbg !53
  %name20 = call i32 %name19(i32 1, i32 2), !dbg !55
  call void @llvm.dbg.value(metadata i32 %name20, metadata !56, metadata !DIExpression()), !dbg !58
  br label %5, !dbg !59

5:                                                ; preds = %4, %3
  ret i32 0, !dbg !60
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test02.c", directory: "/home/free/workspace/compiler/assign3/assign3-tests")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.0-4ubuntu1 "}
!9 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 6, type: !10, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 6, type: !12)
!14 = !DILocation(line: 0, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 6, type: !12)
!16 = !DILocation(line: 7, column: 12, scope: !9)
!17 = !DILocation(line: 7, column: 4, scope: !9)
!18 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 10, type: !10, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 10, type: !12)
!20 = !DILocation(line: 0, scope: !18)
!21 = !DILocalVariable(name: "b", arg: 2, scope: !18, file: !1, line: 10, type: !12)
!22 = !DILocation(line: 11, column: 12, scope: !18)
!23 = !DILocation(line: 11, column: 4, scope: !18)
!24 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 14, type: !25, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!12, !12}
!27 = !DILocalVariable(name: "x", arg: 1, scope: !24, file: !1, line: 14, type: !12)
!28 = !DILocation(line: 0, scope: !24)
!29 = !DILocalVariable(name: "a_fptr", scope: !24, file: !1, line: 15, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!31 = !DILocalVariable(name: "s_fptr", scope: !24, file: !1, line: 16, type: !30)
!32 = !DILocalVariable(name: "t_fptr", scope: !24, file: !1, line: 17, type: !33)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !34)
!34 = !{!35}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !33, file: !1, line: 4, baseType: !30, size: 64)
!36 = !DILocation(line: 17, column: 17, scope: !24)
!37 = !DILocalVariable(name: "op1", scope: !24, file: !1, line: 19, type: !12)
!38 = !DILocalVariable(name: "op2", scope: !24, file: !1, line: 19, type: !12)
!39 = !DILocation(line: 21, column: 11, scope: !40)
!40 = distinct !DILexicalBlock(scope: !24, file: !1, line: 21, column: 9)
!41 = !DILocation(line: 21, column: 9, scope: !24)
!42 = !DILocation(line: 22, column: 15, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 21, column: 17)
!44 = !DILocation(line: 22, column: 22, scope: !43)
!45 = !DILocation(line: 23, column: 5, scope: !43)
!46 = !DILocation(line: 24, column: 15, scope: !47)
!47 = distinct !DILexicalBlock(scope: !40, file: !1, line: 23, column: 12)
!48 = !DILocation(line: 24, column: 22, scope: !47)
!49 = !DILocation(line: 27, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !24, file: !1, line: 27, column: 9)
!51 = !DILocation(line: 27, column: 23, scope: !50)
!52 = !DILocation(line: 27, column: 9, scope: !24)
!53 = !DILocation(line: 28, column: 33, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 27, column: 32)
!55 = !DILocation(line: 28, column: 26, scope: !54)
!56 = !DILocalVariable(name: "result", scope: !54, file: !1, line: 28, type: !57)
!57 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 0, scope: !54)
!59 = !DILocation(line: 29, column: 5, scope: !54)
!60 = !DILocation(line: 30, column: 4, scope: !24)
