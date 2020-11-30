; ModuleID = 'test09.bc'
source_filename = "test09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }
%struct.fsptr = type { %struct.fptr* }

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %name0, i32 %name1) #0 !dbg !20 {
  call void @llvm.dbg.value(metadata i32 %name0, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.value(metadata i32 %name1, metadata !23, metadata !DIExpression()), !dbg !22
  %name2 = add nsw i32 %name0, %name1, !dbg !24
  ret i32 %name2, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %name6, i32 %name7) #0 !dbg !26 {
  call void @llvm.dbg.value(metadata i32 %name6, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 %name7, metadata !29, metadata !DIExpression()), !dbg !28
  %name8 = sub nsw i32 %name6, %name7, !dbg !30
  ret i32 %name8, !dbg !31
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32 %name9) #0 !dbg !32 {
  %name10 = alloca %struct.fptr, align 8
  %name11 = alloca %struct.fsptr, align 8
  call void @llvm.dbg.value(metadata i32 %name9, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata %struct.fptr* %name10, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata %struct.fsptr* %name11, metadata !39, metadata !DIExpression()), !dbg !40
  %name12 = call noalias i8* @malloc(i64 8) #4, !dbg !41
  %name13 = bitcast i8* %name12 to %struct.fsptr*, !dbg !42
  call void @llvm.dbg.value(metadata %struct.fsptr* %name13, metadata !43, metadata !DIExpression()), !dbg !36
  %name14 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %name11, i32 0, i32 0, !dbg !44
  store %struct.fptr* %name10, %struct.fptr** %name14, align 8, !dbg !45
  %name15 = bitcast %struct.fsptr* %name13 to i8*, !dbg !46
  %name16 = bitcast %struct.fsptr* %name11 to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %name15, i8* align 8 %name16, i64 8, i1 false), !dbg !46
  %name17 = icmp sgt i32 %name9, 1, !dbg !47
  br i1 %name17, label %1, label %2, !dbg !49

1:                                                ; preds = %0
  %name18 = getelementptr inbounds %struct.fptr, %struct.fptr* %name10, i32 0, i32 0, !dbg !50
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %name18, align 8, !dbg !52
  %name19 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %name11, i32 0, i32 0, !dbg !53
  %name20 = load %struct.fptr*, %struct.fptr** %name19, align 8, !dbg !53
  %name21 = getelementptr inbounds %struct.fptr, %struct.fptr* %name20, i32 0, i32 0, !dbg !54
  %name22 = load i32 (i32, i32)*, i32 (i32, i32)** %name21, align 8, !dbg !54
  %name23 = call i32 %name22(i32 1, i32 %name9), !dbg !55
  call void @llvm.dbg.value(metadata i32 %name23, metadata !35, metadata !DIExpression()), !dbg !36
  %name24 = getelementptr inbounds %struct.fptr, %struct.fptr* %name10, i32 0, i32 0, !dbg !56
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %name24, align 8, !dbg !57
  br label %3, !dbg !58

2:                                                ; preds = %0
  %name25 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %name13, i32 0, i32 0, !dbg !59
  %name26 = load %struct.fptr*, %struct.fptr** %name25, align 8, !dbg !59
  %name27 = getelementptr inbounds %struct.fptr, %struct.fptr* %name26, i32 0, i32 0, !dbg !61
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %name27, align 8, !dbg !62
  br label %3

3:                                                ; preds = %2, %1
  %.0 = phi i32 [ %name23, %1 ], [ %name9, %2 ]
  call void @llvm.dbg.value(metadata i32 %.0, metadata !35, metadata !DIExpression()), !dbg !36
  %name28 = getelementptr inbounds %struct.fptr, %struct.fptr* %name10, i32 0, i32 0, !dbg !63
  %name29 = load i32 (i32, i32)*, i32 (i32, i32)** %name28, align 8, !dbg !63
  %name30 = call i32 %name29(i32 1, i32 %.0), !dbg !64
  call void @llvm.dbg.value(metadata i32 %name30, metadata !35, metadata !DIExpression()), !dbg !36
  ret void, !dbg !65
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test09.c", directory: "/home/free/workspace/compiler/assign3/assign3-tests")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !1, line: 6, size: 64, elements: !6)
!6 = !{!7}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !5, file: !1, line: 8, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !10)
!10 = !{!11}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !9, file: !1, line: 4, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 10.0.0-4ubuntu1 "}
!20 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 10, type: !13, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !1, line: 10, type: !15)
!22 = !DILocation(line: 0, scope: !20)
!23 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !1, line: 10, type: !15)
!24 = !DILocation(line: 11, column: 12, scope: !20)
!25 = !DILocation(line: 11, column: 4, scope: !20)
!26 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 14, type: !13, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DILocalVariable(name: "a", arg: 1, scope: !26, file: !1, line: 14, type: !15)
!28 = !DILocation(line: 0, scope: !26)
!29 = !DILocalVariable(name: "b", arg: 2, scope: !26, file: !1, line: 14, type: !15)
!30 = !DILocation(line: 15, column: 12, scope: !26)
!31 = !DILocation(line: 15, column: 4, scope: !26)
!32 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 17, type: !33, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !15}
!35 = !DILocalVariable(name: "x", arg: 1, scope: !32, file: !1, line: 17, type: !15)
!36 = !DILocation(line: 0, scope: !32)
!37 = !DILocalVariable(name: "a_fptr", scope: !32, file: !1, line: 19, type: !9)
!38 = !DILocation(line: 19, column: 14, scope: !32)
!39 = !DILocalVariable(name: "s_fptr", scope: !32, file: !1, line: 20, type: !5)
!40 = !DILocation(line: 20, column: 15, scope: !32)
!41 = !DILocation(line: 21, column: 38, scope: !32)
!42 = !DILocation(line: 21, column: 23, scope: !32)
!43 = !DILocalVariable(name: "w_fptr", scope: !32, file: !1, line: 21, type: !4)
!44 = !DILocation(line: 22, column: 9, scope: !32)
!45 = !DILocation(line: 22, column: 13, scope: !32)
!46 = !DILocation(line: 23, column: 10, scope: !32)
!47 = !DILocation(line: 24, column: 6, scope: !48)
!48 = distinct !DILexicalBlock(scope: !32, file: !1, line: 24, column: 5)
!49 = !DILocation(line: 24, column: 5, scope: !32)
!50 = !DILocation(line: 26, column: 11, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !1, line: 25, column: 2)
!52 = !DILocation(line: 26, column: 17, scope: !51)
!53 = !DILocation(line: 27, column: 13, scope: !51)
!54 = !DILocation(line: 27, column: 19, scope: !51)
!55 = !DILocation(line: 27, column: 6, scope: !51)
!56 = !DILocation(line: 28, column: 11, scope: !51)
!57 = !DILocation(line: 28, column: 17, scope: !51)
!58 = !DILocation(line: 29, column: 2, scope: !51)
!59 = !DILocation(line: 31, column: 11, scope: !60)
!60 = distinct !DILexicalBlock(scope: !48, file: !1, line: 30, column: 2)
!61 = !DILocation(line: 31, column: 17, scope: !60)
!62 = !DILocation(line: 31, column: 23, scope: !60)
!63 = !DILocation(line: 33, column: 11, scope: !32)
!64 = !DILocation(line: 33, column: 4, scope: !32)
!65 = !DILocation(line: 34, column: 1, scope: !32)
