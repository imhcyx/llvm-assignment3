; ModuleID = 'test22.bc'
source_filename = "test22.c"
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
define dso_local i32 @foo(i32 %name9, i32 %name10, i32 (i32, i32)* %name11) #0 !dbg !22 {
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
define dso_local void @make_simple_alias(%struct.fptr* %name17, %struct.fptr* %name18) #0 !dbg !37 {
  call void @llvm.dbg.value(metadata %struct.fptr* %name17, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata %struct.fptr* %name18, metadata !43, metadata !DIExpression()), !dbg !42
  %name19 = getelementptr inbounds %struct.fptr, %struct.fptr* %name18, i32 0, i32 0, !dbg !44
  %name20 = load i32 (i32, i32)*, i32 (i32, i32)** %name19, align 8, !dbg !44
  %name21 = getelementptr inbounds %struct.fptr, %struct.fptr* %name17, i32 0, i32 0, !dbg !45
  store i32 (i32, i32)* %name20, i32 (i32, i32)** %name21, align 8, !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever() #0 !dbg !48 {
  %name22 = alloca %struct.fptr, align 8
  %name23 = alloca %struct.fptr, align 8
  call void @llvm.dbg.value(metadata i32 (i32, i32, i32 (i32, i32)*)* null, metadata !51, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata %struct.fptr* %name22, metadata !54, metadata !DIExpression()), !dbg !55
  %name24 = bitcast %struct.fptr* %name22 to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 8 %name24, i8 0, i64 8, i1 false), !dbg !55
  call void @llvm.dbg.declare(metadata %struct.fptr* %name23, metadata !56, metadata !DIExpression()), !dbg !57
  %name25 = bitcast %struct.fptr* %name23 to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 8 %name25, i8 0, i64 8, i1 false), !dbg !57
  %name26 = getelementptr inbounds %struct.fptr, %struct.fptr* %name22, i32 0, i32 0, !dbg !58
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %name26, align 8, !dbg !59
  %name27 = getelementptr inbounds %struct.fptr, %struct.fptr* %name23, i32 0, i32 0, !dbg !60
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %name27, align 8, !dbg !61
  call void @llvm.dbg.value(metadata i32 (i32, i32, i32 (i32, i32)*)* @foo, metadata !51, metadata !DIExpression()), !dbg !53
  call void @make_simple_alias(%struct.fptr* %name22, %struct.fptr* %name23), !dbg !62
  %name28 = getelementptr inbounds %struct.fptr, %struct.fptr* %name22, i32 0, i32 0, !dbg !63
  %name29 = load i32 (i32, i32)*, i32 (i32, i32)** %name28, align 8, !dbg !63
  %name30 = call i32 @foo(i32 1, i32 2, i32 (i32, i32)* %name29), !dbg !63
  call void @llvm.dbg.value(metadata i32 %name30, metadata !64, metadata !DIExpression()), !dbg !53
  ret i32 0, !dbg !66
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
!1 = !DIFile(filename: "test22.c", directory: "/home/free/workspace/compiler/assign3/assign3-tests")
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
!16 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 10, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 10, type: !10)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 10, type: !10)
!20 = !DILocation(line: 12, column: 13, scope: !16)
!21 = !DILocation(line: 12, column: 5, scope: !16)
!22 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 15, type: !23, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!10, !10, !10, !25}
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !26)
!26 = !{!27}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !25, file: !1, line: 4, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!29 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 15, type: !10)
!30 = !DILocation(line: 0, scope: !22)
!31 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 15, type: !10)
!32 = !DILocalVariable(name: "af_ptr", arg: 3, scope: !22, file: !1, line: 15, type: !25)
!33 = !DILocation(line: 15, column: 33, scope: !22)
!34 = !DILocation(line: 17, column: 19, scope: !22)
!35 = !DILocation(line: 17, column: 12, scope: !22)
!36 = !DILocation(line: 17, column: 5, scope: !22)
!37 = distinct !DISubprogram(name: "make_simple_alias", scope: !1, file: !1, line: 19, type: !38, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !40, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!41 = !DILocalVariable(name: "a", arg: 1, scope: !37, file: !1, line: 19, type: !40)
!42 = !DILocation(line: 0, scope: !37)
!43 = !DILocalVariable(name: "b", arg: 2, scope: !37, file: !1, line: 19, type: !40)
!44 = !DILocation(line: 21, column: 18, scope: !37)
!45 = !DILocation(line: 21, column: 8, scope: !37)
!46 = !DILocation(line: 21, column: 14, scope: !37)
!47 = !DILocation(line: 22, column: 1, scope: !37)
!48 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 23, type: !49, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!10}
!51 = !DILocalVariable(name: "af_ptr", scope: !48, file: !1, line: 25, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!53 = !DILocation(line: 0, scope: !48)
!54 = !DILocalVariable(name: "tf_ptr", scope: !48, file: !1, line: 26, type: !25)
!55 = !DILocation(line: 26, column: 17, scope: !48)
!56 = !DILocalVariable(name: "sf_ptr", scope: !48, file: !1, line: 27, type: !25)
!57 = !DILocation(line: 27, column: 17, scope: !48)
!58 = !DILocation(line: 28, column: 12, scope: !48)
!59 = !DILocation(line: 28, column: 18, scope: !48)
!60 = !DILocation(line: 29, column: 12, scope: !48)
!61 = !DILocation(line: 29, column: 18, scope: !48)
!62 = !DILocation(line: 31, column: 5, scope: !48)
!63 = !DILocation(line: 32, column: 23, scope: !48)
!64 = !DILocalVariable(name: "result", scope: !48, file: !1, line: 32, type: !65)
!65 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!66 = !DILocation(line: 33, column: 5, scope: !48)
