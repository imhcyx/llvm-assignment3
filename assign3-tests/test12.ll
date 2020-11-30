; ModuleID = 'test12.bc'
source_filename = "test12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %name0, i32 %name1) #0 !dbg !16 {
  call void @llvm.dbg.value(metadata i32 %name0, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 %name1, metadata !19, metadata !DIExpression()), !dbg !18
  %name2 = add nsw i32 %name0, %name1, !dbg !20
  ret i32 %name2, !dbg !21
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %name6, i32 %name7) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %name6, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.value(metadata i32 %name7, metadata !25, metadata !DIExpression()), !dbg !24
  %name8 = sub nsw i32 %name6, %name7, !dbg !26
  ret i32 %name8, !dbg !27
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %name9, i32 %name10, i32 (i32, i32)* %name11) #0 !dbg !28 {
  call void @llvm.dbg.value(metadata i32 %name9, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.value(metadata i32 %name10, metadata !33, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %name11, metadata !34, metadata !DIExpression()), !dbg !32
  %name12 = call i32 %name11(i32 %name9, i32 %name10), !dbg !35
  ret i32 %name12, !dbg !36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %name13, i32 %name14, i32 %name15) #0 !dbg !37 {
  call void @llvm.dbg.value(metadata i8 %name13, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i32 %name14, metadata !43, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i32 %name15, metadata !44, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !45, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !46, metadata !DIExpression()), !dbg !42
  %name16 = call noalias i8* @malloc(i64 8) #3, !dbg !47
  %name17 = bitcast i8* %name16 to %struct.fptr*, !dbg !48
  call void @llvm.dbg.value(metadata %struct.fptr* %name17, metadata !49, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i32 (i32, i32, i32 (i32, i32)*)* @clever, metadata !50, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.value(metadata i32 0, metadata !52, metadata !DIExpression()), !dbg !42
  %name18 = sext i8 %name13 to i32, !dbg !54
  %name19 = icmp eq i32 %name18, 43, !dbg !56
  br i1 %name19, label %1, label %2, !dbg !57

1:                                                ; preds = %0
  %name20 = getelementptr inbounds %struct.fptr, %struct.fptr* %name17, i32 0, i32 0, !dbg !58
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %name20, align 8, !dbg !60
  br label %3, !dbg !61

2:                                                ; preds = %0
  %name21 = getelementptr inbounds %struct.fptr, %struct.fptr* %name17, i32 0, i32 0, !dbg !62
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %name21, align 8, !dbg !64
  br label %3

3:                                                ; preds = %2, %1
  %name22 = getelementptr inbounds %struct.fptr, %struct.fptr* %name17, i32 0, i32 0, !dbg !65
  %name23 = load i32 (i32, i32)*, i32 (i32, i32)** %name22, align 8, !dbg !65
  %name24 = call i32 @clever(i32 %name14, i32 %name15, i32 (i32, i32)* %name23), !dbg !66
  call void @llvm.dbg.value(metadata i32 %name24, metadata !52, metadata !DIExpression()), !dbg !42
  ret i32 %name24, !dbg !67
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
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test12.c", directory: "/home/free/workspace/compiler/assign3/assign3-tests")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 13, size: 64, elements: !6)
!6 = !{!7}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !5, file: !1, line: 15, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"clang version 10.0.0-4ubuntu1 "}
!16 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 2, type: !9, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 2, type: !11)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 2, type: !11)
!20 = !DILocation(line: 3, column: 12, scope: !16)
!21 = !DILocation(line: 3, column: 4, scope: !16)
!22 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !9, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 6, type: !11)
!24 = !DILocation(line: 0, scope: !22)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 6, type: !11)
!26 = !DILocation(line: 7, column: 12, scope: !22)
!27 = !DILocation(line: 7, column: 4, scope: !22)
!28 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 10, type: !29, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!11, !11, !11, !8}
!31 = !DILocalVariable(name: "a", arg: 1, scope: !28, file: !1, line: 10, type: !11)
!32 = !DILocation(line: 0, scope: !28)
!33 = !DILocalVariable(name: "b", arg: 2, scope: !28, file: !1, line: 10, type: !11)
!34 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !28, file: !1, line: 10, type: !8)
!35 = !DILocation(line: 11, column: 12, scope: !28)
!36 = !DILocation(line: 11, column: 5, scope: !28)
!37 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 18, type: !38, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!11, !40, !11, !11}
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "x", arg: 1, scope: !37, file: !1, line: 18, type: !40)
!42 = !DILocation(line: 0, scope: !37)
!43 = !DILocalVariable(name: "op1", arg: 2, scope: !37, file: !1, line: 18, type: !11)
!44 = !DILocalVariable(name: "op2", arg: 3, scope: !37, file: !1, line: 18, type: !11)
!45 = !DILocalVariable(name: "a_fptr", scope: !37, file: !1, line: 19, type: !8)
!46 = !DILocalVariable(name: "s_fptr", scope: !37, file: !1, line: 20, type: !8)
!47 = !DILocation(line: 21, column: 41, scope: !37)
!48 = !DILocation(line: 21, column: 26, scope: !37)
!49 = !DILocalVariable(name: "t_fptr", scope: !37, file: !1, line: 21, type: !4)
!50 = !DILocalVariable(name: "af_ptr", scope: !37, file: !1, line: 22, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!52 = !DILocalVariable(name: "result", scope: !37, file: !1, line: 23, type: !53)
!53 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 24, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !37, file: !1, line: 24, column: 9)
!56 = !DILocation(line: 24, column: 11, scope: !55)
!57 = !DILocation(line: 24, column: 9, scope: !37)
!58 = !DILocation(line: 25, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !1, line: 24, column: 19)
!60 = !DILocation(line: 25, column: 23, scope: !59)
!61 = !DILocation(line: 26, column: 5, scope: !59)
!62 = !DILocation(line: 28, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !55, file: !1, line: 27, column: 5)
!64 = !DILocation(line: 28, column: 23, scope: !63)
!65 = !DILocation(line: 30, column: 38, scope: !37)
!66 = !DILocation(line: 30, column: 13, scope: !37)
!67 = !DILocation(line: 31, column: 5, scope: !37)
