; ModuleID = '3.bc'
source_filename = "3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"Result: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @someFunction(i32 noundef %0) #0 !dbg !10 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !15, metadata !DIExpression()), !dbg !16
  %4 = load i32, i32* %3, align 4, !dbg !17
  %5 = icmp eq i32 %4, 100000, !dbg !19
  br i1 %5, label %6, label %7, !dbg !20

6:                                                ; preds = %1
  store i32 42, i32* %2, align 4, !dbg !21
  br label %10, !dbg !21

7:                                                ; preds = %1
  %8 = load i32, i32* %3, align 4, !dbg !23
  %9 = add nsw i32 %8, 1, !dbg !24
  store i32 %9, i32* %2, align 4, !dbg !25
  br label %10, !dbg !25

10:                                               ; preds = %7, %6
  %11 = load i32, i32* %2, align 4, !dbg !26
  ret i32 %11, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !27 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !30, metadata !DIExpression()), !dbg !31
  %4 = bitcast i32* %2 to i8*, !dbg !32
  call void @klee_make_symbolic(i8* noundef %4, i64 noundef 4, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %3, metadata !34, metadata !DIExpression()), !dbg !35
  %5 = load i32, i32* %2, align 4, !dbg !36
  %6 = call i32 @someFunction(i32 noundef %5), !dbg !37
  store i32 %6, i32* %3, align 4, !dbg !35
  %7 = load i32, i32* %3, align 4, !dbg !38
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 noundef %7), !dbg !39
  ret i32 0, !dbg !40
}

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) #2

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "3.c", directory: "/home/rongfeng/klee/code/10 programs", checksumkind: CSK_MD5, checksum: "350741e608fc6611fd55c2ef774415cf")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "someFunction", scope: !1, file: !1, line: 4, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "y", arg: 1, scope: !10, file: !1, line: 4, type: !13)
!16 = !DILocation(line: 4, column: 22, scope: !10)
!17 = !DILocation(line: 6, column: 9, scope: !18)
!18 = distinct !DILexicalBlock(scope: !10, file: !1, line: 6, column: 9)
!19 = !DILocation(line: 6, column: 11, scope: !18)
!20 = !DILocation(line: 6, column: 9, scope: !10)
!21 = !DILocation(line: 7, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !1, line: 6, column: 22)
!23 = !DILocation(line: 9, column: 12, scope: !10)
!24 = !DILocation(line: 9, column: 14, scope: !10)
!25 = !DILocation(line: 9, column: 5, scope: !10)
!26 = !DILocation(line: 10, column: 1, scope: !10)
!27 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 12, type: !28, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!28 = !DISubroutineType(types: !29)
!29 = !{!13}
!30 = !DILocalVariable(name: "x", scope: !27, file: !1, line: 13, type: !13)
!31 = !DILocation(line: 13, column: 9, scope: !27)
!32 = !DILocation(line: 14, column: 24, scope: !27)
!33 = !DILocation(line: 14, column: 5, scope: !27)
!34 = !DILocalVariable(name: "result", scope: !27, file: !1, line: 16, type: !13)
!35 = !DILocation(line: 16, column: 9, scope: !27)
!36 = !DILocation(line: 16, column: 31, scope: !27)
!37 = !DILocation(line: 16, column: 18, scope: !27)
!38 = !DILocation(line: 17, column: 28, scope: !27)
!39 = !DILocation(line: 17, column: 5, scope: !27)
!40 = !DILocation(line: 19, column: 5, scope: !27)
