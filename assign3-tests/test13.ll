; ModuleID = 'test13.bc'
source_filename = "test13.c"
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
define dso_local i32 @clever(i32 %name9, i32 %name10, i32 (i32, i32)* %name11) #0 !dbg !22 {
  %name12 = alloca %struct.fptr, align 8
  %name13 = getelementptr inbounds %struct.fptr, %struct.fptr* %name12, i32 0, i32 0
  store i32 (i32, i32)* %name11, i32 (i32, i32)** %name13, align 8
  call void @llvm.dbg.value(metadata i32 %name9, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.value(metadata i32 %name10, metadata !31, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata %struct.fptr* %name12, metadata !32, metadata !DIExpression()), !dbg !33
  %name14 = getelementptr inbounds %struct.fptr, %struct.fptr* %name12, i32 0, i32 0, !dbg !34
  %name15 = load i32 (i32, i32)*, i32 (i32, i32)** %name14, align 8, !dbg !34
  %name16 = call i32 %name15(i32 %name9, i32 %name10), !dbg !35
  ret i32 %name16, !dbg !36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %name17, i32 %name18, i32 %name19) #0 !dbg !37 {
  %name20 = alloca %struct.fptr, align 8
  call void @llvm.dbg.value(metadata i8 %name17, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i32 %name18, metadata !43, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i32 %name19, metadata !44, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !45, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !46, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata %struct.fptr* %name20, metadata !47, metadata !DIExpression()), !dbg !48
  %name21 = bitcast %struct.fptr* %name20 to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 8 %name21, i8 0, i64 8, i1 false), !dbg !48
  %name22 = sext i8 %name17 to i32, !dbg !49
  %name23 = icmp eq i32 %name22, 43, !dbg !51
  br i1 %name23, label %1, label %2, !dbg !52

1:                                                ; preds = %0
  %name24 = getelementptr inbounds %struct.fptr, %struct.fptr* %name20, i32 0, i32 0, !dbg !53
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %name24, align 8, !dbg !55
  br label %5, !dbg !56

2:                                                ; preds = %0
  %name25 = sext i8 %name17 to i32, !dbg !57
  %name26 = icmp eq i32 %name25, 45, !dbg !59
  br i1 %name26, label %3, label %4, !dbg !60

3:                                                ; preds = %2
  %name27 = getelementptr inbounds %struct.fptr, %struct.fptr* %name20, i32 0, i32 0, !dbg !61
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %name27, align 8, !dbg !63
  br label %4, !dbg !64

4:                                                ; preds = %3, %2
  br label %5

5:                                                ; preds = %4, %1
  %name28 = getelementptr inbounds %struct.fptr, %struct.fptr* %name20, i32 0, i32 0, !dbg !65
  %name29 = load i32 (i32, i32)*, i32 (i32, i32)** %name28, align 8, !dbg !65
  %name30 = call i32 @clever(i32 %name18, i32 %name19, i32 (i32, i32)* %name29), !dbg !65
  call void @llvm.dbg.value(metadata i32 %name30, metadata !66, metadata !DIExpression()), !dbg !42
  ret i32 0, !dbg !68
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
!1 = !DIFile(filename: "test13.c", directory: "/home/free/workspace/compiler/assign3/assign3-tests")
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
!22 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 14, type: !23, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!10, !10, !10, !25}
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !26)
!26 = !{!27}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !25, file: !1, line: 4, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!29 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 14, type: !10)
!30 = !DILocation(line: 0, scope: !22)
!31 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 14, type: !10)
!32 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !22, file: !1, line: 14, type: !25)
!33 = !DILocation(line: 14, column: 38, scope: !22)
!34 = !DILocation(line: 15, column: 19, scope: !22)
!35 = !DILocation(line: 15, column: 12, scope: !22)
!36 = !DILocation(line: 15, column: 5, scope: !22)
!37 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 19, type: !38, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!10, !40, !10, !10}
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "x", arg: 1, scope: !37, file: !1, line: 19, type: !40)
!42 = !DILocation(line: 0, scope: !37)
!43 = !DILocalVariable(name: "op1", arg: 2, scope: !37, file: !1, line: 19, type: !10)
!44 = !DILocalVariable(name: "op2", arg: 3, scope: !37, file: !1, line: 19, type: !10)
!45 = !DILocalVariable(name: "a_fptr", scope: !37, file: !1, line: 20, type: !28)
!46 = !DILocalVariable(name: "s_fptr", scope: !37, file: !1, line: 21, type: !28)
!47 = !DILocalVariable(name: "t_fptr", scope: !37, file: !1, line: 22, type: !25)
!48 = !DILocation(line: 22, column: 17, scope: !37)
!49 = !DILocation(line: 24, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !37, file: !1, line: 24, column: 9)
!51 = !DILocation(line: 24, column: 11, scope: !50)
!52 = !DILocation(line: 24, column: 9, scope: !37)
!53 = !DILocation(line: 25, column: 15, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 24, column: 19)
!55 = !DILocation(line: 25, column: 22, scope: !54)
!56 = !DILocation(line: 26, column: 5, scope: !54)
!57 = !DILocation(line: 27, column: 14, scope: !58)
!58 = distinct !DILexicalBlock(scope: !50, file: !1, line: 27, column: 14)
!59 = !DILocation(line: 27, column: 16, scope: !58)
!60 = !DILocation(line: 27, column: 14, scope: !50)
!61 = !DILocation(line: 28, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !1, line: 27, column: 24)
!63 = !DILocation(line: 28, column: 22, scope: !62)
!64 = !DILocation(line: 29, column: 5, scope: !62)
!65 = !DILocation(line: 31, column: 23, scope: !37)
!66 = !DILocalVariable(name: "result", scope: !37, file: !1, line: 31, type: !67)
!67 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!68 = !DILocation(line: 32, column: 5, scope: !37)
