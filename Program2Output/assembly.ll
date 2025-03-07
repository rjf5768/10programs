; ModuleID = '2.bc'
source_filename = "2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@globalUnused = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"x is 0\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"x is 1\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Magic big number.\0A\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"x is something else.\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !14 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !18, metadata !DIExpression()), !dbg !19
  %3 = bitcast i32* %2 to i8*, !dbg !20
  call void @klee_make_symbolic(i8* noundef %3, i64 noundef 4, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !21
  %4 = load i32, i32* %2, align 4, !dbg !22
  switch i32 %4, label %11 [
    i32 0, label %5
    i32 1, label %7
    i32 99999, label %9
  ], !dbg !23

5:                                                ; preds = %0
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !24
  br label %13, !dbg !26

7:                                                ; preds = %0
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0)), !dbg !27
  br label %13, !dbg !28

9:                                                ; preds = %0
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0)), !dbg !29
  br label %13, !dbg !30

11:                                               ; preds = %0
  %12 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i64 0, i64 0)), !dbg !31
  br label %13, !dbg !32

13:                                               ; preds = %11, %9, %7, %5
  ret i32 0, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) #2

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "globalUnused", scope: !2, file: !3, line: 5, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "2.c", directory: "/home/rongfeng/klee/code/10 programs", checksumkind: CSK_MD5, checksum: "09f2a8646ad185f51e131c3ebf7ec5f8")
!4 = !{!0}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!14 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 7, type: !15, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!5}
!17 = !{}
!18 = !DILocalVariable(name: "x", scope: !14, file: !3, line: 8, type: !5)
!19 = !DILocation(line: 8, column: 9, scope: !14)
!20 = !DILocation(line: 9, column: 24, scope: !14)
!21 = !DILocation(line: 9, column: 5, scope: !14)
!22 = !DILocation(line: 11, column: 13, scope: !14)
!23 = !DILocation(line: 11, column: 5, scope: !14)
!24 = !DILocation(line: 13, column: 13, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !3, line: 11, column: 16)
!26 = !DILocation(line: 14, column: 13, scope: !25)
!27 = !DILocation(line: 16, column: 13, scope: !25)
!28 = !DILocation(line: 17, column: 13, scope: !25)
!29 = !DILocation(line: 19, column: 13, scope: !25)
!30 = !DILocation(line: 20, column: 13, scope: !25)
!31 = !DILocation(line: 22, column: 13, scope: !25)
!32 = !DILocation(line: 23, column: 13, scope: !25)
!33 = !DILocation(line: 26, column: 5, scope: !14)
