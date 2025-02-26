; ModuleID = 'test03.bc'
source_filename = "test03.c"
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
define dso_local i32 @clever(i32 %name9) #0 !dbg !24 {
  %name10 = alloca [2 x i32 (i32, i32)*], align 16
  call void @llvm.dbg.value(metadata i32 %name9, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !29, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !31, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [2 x i32 (i32, i32)*]* %name10, metadata !32, metadata !DIExpression()), !dbg !36
  %name11 = bitcast [2 x i32 (i32, i32)*]* %name10 to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %name11, i8 0, i64 16, i1 false), !dbg !36
  call void @llvm.dbg.value(metadata i32 1, metadata !37, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 2, metadata !38, metadata !DIExpression()), !dbg !28
  %name12 = icmp eq i32 %name9, 3, !dbg !39
  br i1 %name12, label %1, label %2, !dbg !41

1:                                                ; preds = %0
  %name13 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %name10, i64 0, i64 0, !dbg !42
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %name13, align 16, !dbg !44
  br label %2, !dbg !45

2:                                                ; preds = %1, %0
  %name14 = icmp eq i32 %name9, 4, !dbg !46
  br i1 %name14, label %3, label %4, !dbg !48

3:                                                ; preds = %2
  %name15 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %name10, i64 0, i64 0, !dbg !49
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %name15, align 16, !dbg !51
  br label %4, !dbg !52

4:                                                ; preds = %3, %2
  %name16 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %name10, i64 0, i64 0, !dbg !53
  %name17 = load i32 (i32, i32)*, i32 (i32, i32)** %name16, align 16, !dbg !53
  %name18 = icmp ne i32 (i32, i32)* %name17, null, !dbg !55
  br i1 %name18, label %5, label %6, !dbg !56

5:                                                ; preds = %4
  %name19 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %name10, i64 0, i64 0, !dbg !57
  %name20 = load i32 (i32, i32)*, i32 (i32, i32)** %name19, align 16, !dbg !57
  %name21 = call i32 %name20(i32 1, i32 2), !dbg !57
  call void @llvm.dbg.value(metadata i32 %name21, metadata !59, metadata !DIExpression()), !dbg !61
  br label %6, !dbg !62

6:                                                ; preds = %5, %4
  ret i32 0, !dbg !63
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
!1 = !DIFile(filename: "test03.c", directory: "/home/free/workspace/compiler/assign3/assign3-tests")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.0-4ubuntu1 "}
!9 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 3, type: !10, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 3, type: !12)
!14 = !DILocation(line: 0, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 3, type: !12)
!16 = !DILocation(line: 4, column: 12, scope: !9)
!17 = !DILocation(line: 4, column: 4, scope: !9)
!18 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 7, type: !10, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 7, type: !12)
!20 = !DILocation(line: 0, scope: !18)
!21 = !DILocalVariable(name: "b", arg: 2, scope: !18, file: !1, line: 7, type: !12)
!22 = !DILocation(line: 8, column: 12, scope: !18)
!23 = !DILocation(line: 8, column: 4, scope: !18)
!24 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 11, type: !25, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!12, !12}
!27 = !DILocalVariable(name: "x", arg: 1, scope: !24, file: !1, line: 11, type: !12)
!28 = !DILocation(line: 0, scope: !24)
!29 = !DILocalVariable(name: "a_fptr", scope: !24, file: !1, line: 12, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!31 = !DILocalVariable(name: "s_fptr", scope: !24, file: !1, line: 13, type: !30)
!32 = !DILocalVariable(name: "t_fptr", scope: !24, file: !1, line: 14, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 128, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 2)
!36 = !DILocation(line: 14, column: 11, scope: !24)
!37 = !DILocalVariable(name: "op1", scope: !24, file: !1, line: 16, type: !12)
!38 = !DILocalVariable(name: "op2", scope: !24, file: !1, line: 16, type: !12)
!39 = !DILocation(line: 18, column: 11, scope: !40)
!40 = distinct !DILexicalBlock(scope: !24, file: !1, line: 18, column: 9)
!41 = !DILocation(line: 18, column: 9, scope: !24)
!42 = !DILocation(line: 19, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 18, column: 17)
!44 = !DILocation(line: 19, column: 18, scope: !43)
!45 = !DILocation(line: 20, column: 5, scope: !43)
!46 = !DILocation(line: 21, column: 11, scope: !47)
!47 = distinct !DILexicalBlock(scope: !24, file: !1, line: 21, column: 9)
!48 = !DILocation(line: 21, column: 9, scope: !24)
!49 = !DILocation(line: 22, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !1, line: 21, column: 17)
!51 = !DILocation(line: 22, column: 17, scope: !50)
!52 = !DILocation(line: 23, column: 5, scope: !50)
!53 = !DILocation(line: 26, column: 9, scope: !54)
!54 = distinct !DILexicalBlock(scope: !24, file: !1, line: 26, column: 9)
!55 = !DILocation(line: 26, column: 19, scope: !54)
!56 = !DILocation(line: 26, column: 9, scope: !24)
!57 = !DILocation(line: 27, column: 26, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 26, column: 28)
!59 = !DILocalVariable(name: "result", scope: !58, file: !1, line: 27, type: !60)
!60 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 0, scope: !58)
!62 = !DILocation(line: 28, column: 5, scope: !58)
!63 = !DILocation(line: 29, column: 4, scope: !24)
