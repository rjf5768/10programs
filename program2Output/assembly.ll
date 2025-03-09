; ModuleID = '2.bc'
source_filename = "2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"x\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %3, align 4
  %4 = bitcast i32* %2 to i8*
  call void @klee_make_symbolic(i8* noundef %4, i64 noundef 4, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %5 = load i32, i32* %3, align 4
  switch i32 %5, label %7 [
    i32 2, label %6
  ]

6:                                                ; preds = %0
  store i32 42, i32* %1, align 4
  br label %13

7:                                                ; preds = %0
  %8 = load i32, i32* %2, align 4
  switch i32 %8, label %12 [
    i32 0, label %9
    i32 1, label %10
    i32 99999, label %11
  ]

9:                                                ; preds = %7
  store i32 0, i32* %1, align 4
  br label %13

10:                                               ; preds = %7
  store i32 1, i32* %1, align 4
  br label %13

11:                                               ; preds = %7
  store i32 99999, i32* %1, align 4
  br label %13

12:                                               ; preds = %7
  store i32 0, i32* %1, align 4
  br label %13

13:                                               ; preds = %12, %11, %10, %9, %6
  %14 = load i32, i32* %1, align 4
  ret i32 %14
}

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
