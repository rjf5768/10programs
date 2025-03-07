; ModuleID = '1.bc'
source_filename = "1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [19 x i8] c"I'm never called!\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"x is positive.\0A\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Magic negative!\0A\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"x is non-positive.\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @neverCalled() #0 !dbg !10 {
  %1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0)), !dbg !14
  ret void, !dbg !15
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !16 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !20, metadata !DIExpression()), !dbg !21
  %3 = bitcast i32* %2 to i8*, !dbg !22
  call void @klee_make_symbolic(i8* noundef %3, i64 noundef 4, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !23
  %4 = load i32, i32* %2, align 4, !dbg !24
  %5 = icmp sgt i32 %4, 0, !dbg !26
  br i1 %5, label %6, label %8, !dbg !27

6:                                                ; preds = %0
  %7 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !28
  br label %15, !dbg !30

8:                                                ; preds = %0
  %9 = load i32, i32* %2, align 4, !dbg !31
  %10 = icmp eq i32 %9, -99999, !dbg !34
  br i1 %10, label %11, label %13, !dbg !35

11:                                               ; preds = %8
  %12 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !36
  br label %13, !dbg !38

13:                                               ; preds = %11, %8
  %14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0)), !dbg !39
  br label %15

15:                                               ; preds = %13, %6
  ret i32 0, !dbg !40
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "1.c", directory: "/home/rongfeng/klee/code/10 programs", checksumkind: CSK_MD5, checksum: "46a4d437a7c1e9830177c29bbab2b159")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "neverCalled", scope: !1, file: !1, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocation(line: 6, column: 5, scope: !10)
!15 = !DILocation(line: 7, column: 1, scope: !10)
!16 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 9, type: !17, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!17 = !DISubroutineType(types: !18)
!18 = !{!19}
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocalVariable(name: "x", scope: !16, file: !1, line: 10, type: !19)
!21 = !DILocation(line: 10, column: 9, scope: !16)
!22 = !DILocation(line: 11, column: 24, scope: !16)
!23 = !DILocation(line: 11, column: 5, scope: !16)
!24 = !DILocation(line: 13, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !16, file: !1, line: 13, column: 9)
!26 = !DILocation(line: 13, column: 11, scope: !25)
!27 = !DILocation(line: 13, column: 9, scope: !16)
!28 = !DILocation(line: 14, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 13, column: 16)
!30 = !DILocation(line: 15, column: 5, scope: !29)
!31 = !DILocation(line: 17, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !1, line: 17, column: 13)
!33 = distinct !DILexicalBlock(scope: !25, file: !1, line: 15, column: 12)
!34 = !DILocation(line: 17, column: 15, scope: !32)
!35 = !DILocation(line: 17, column: 13, scope: !33)
!36 = !DILocation(line: 19, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !1, line: 17, column: 26)
!38 = !DILocation(line: 20, column: 9, scope: !37)
!39 = !DILocation(line: 21, column: 9, scope: !33)
!40 = !DILocation(line: 24, column: 5, scope: !16)
