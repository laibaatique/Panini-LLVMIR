; ModuleID = '500.c'
source_filename = "500.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

@.str = private unnamed_addr constant [15 x i8] c"i == strlen(s)\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"500.c\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @f500(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %0) #8
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %42, label %4

4:                                                ; preds = %1, %9
  %5 = phi i64 [ %10, %9 ], [ 0, %1 ]
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 %5
  %7 = load i8, ptr %6, align 1, !tbaa !5
  %8 = icmp eq i8 %7, 97
  br i1 %8, label %9, label %12

9:                                                ; preds = %4
  %10 = add nuw i64 %5, 1
  %11 = icmp eq i64 %10, %2
  br i1 %11, label %12, label %4, !llvm.loop !8

12:                                               ; preds = %9, %4
  %13 = phi i64 [ %2, %9 ], [ %5, %4 ]
  %14 = and i64 %13, 4294967295
  %15 = icmp ugt i64 %2, %14
  br i1 %15, label %16, label %27

16:                                               ; preds = %12, %21
  %17 = phi i64 [ %22, %21 ], [ %14, %12 ]
  %18 = getelementptr inbounds nuw i8, ptr %0, i64 %17
  %19 = load i8, ptr %18, align 1, !tbaa !5
  %20 = icmp eq i8 %19, 98
  br i1 %20, label %21, label %24

21:                                               ; preds = %16
  %22 = add nuw nsw i64 %17, 1
  %23 = icmp ugt i64 %2, %22
  br i1 %23, label %16, label %24, !llvm.loop !10

24:                                               ; preds = %16, %21
  %25 = phi i64 [ %22, %21 ], [ %17, %16 ]
  %26 = and i64 %25, 4294967295
  br label %27

27:                                               ; preds = %24, %12
  %28 = phi i64 [ %26, %24 ], [ %14, %12 ]
  %29 = icmp ugt i64 %2, %28
  br i1 %29, label %33, label %38

30:                                               ; preds = %33
  %31 = add nuw nsw i64 %34, 1
  %32 = icmp ugt i64 %2, %31
  br i1 %32, label %33, label %38, !llvm.loop !11

33:                                               ; preds = %27, %30
  %34 = phi i64 [ %31, %30 ], [ %28, %27 ]
  %35 = getelementptr inbounds nuw i8, ptr %0, i64 %34
  %36 = load i8, ptr %35, align 1, !tbaa !5
  %37 = icmp eq i8 %36, 99
  br i1 %37, label %30, label %38

38:                                               ; preds = %30, %33, %27
  %39 = phi i64 [ %28, %27 ], [ %34, %33 ], [ %31, %30 ]
  %40 = icmp eq i64 %2, %39
  br i1 %40, label %42, label %41

41:                                               ; preds = %38
  tail call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 28) #9
  unreachable

42:                                               ; preds = %1, %38
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare dso_local i64 @strlen(ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: noreturn
declare dllimport void @_assert(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca [10240 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 10240, ptr nonnull %3) #8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(10240) %3, i8 0, i64 10240, i1 false)
  %4 = icmp eq i32 %0, 1
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  %6 = tail call ptr @__acrt_iob_func(i32 noundef 0) #8
  %7 = tail call i32 @fileno(ptr noundef %6)
  %8 = call i32 @read(i32 noundef %7, ptr noundef nonnull %3, i32 noundef 10240) #8
  br label %15

9:                                                ; preds = %2
  %10 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %11 = load ptr, ptr %10, align 8, !tbaa !12
  %12 = tail call i32 (ptr, i32, ...) @open(ptr noundef %11, i32 noundef 0) #8
  %13 = call i32 @read(i32 noundef %12, ptr noundef nonnull %3, i32 noundef 10240) #8
  %14 = call i32 @close(i32 noundef %12) #8
  br label %15

15:                                               ; preds = %9, %5
  %16 = call i64 @strlen(ptr noundef nonnull readonly dereferenceable(1) %3) #8
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %56, label %18

18:                                               ; preds = %15, %23
  %19 = phi i64 [ %24, %23 ], [ 0, %15 ]
  %20 = getelementptr inbounds nuw i8, ptr %3, i64 %19
  %21 = load i8, ptr %20, align 1, !tbaa !5
  %22 = icmp eq i8 %21, 97
  br i1 %22, label %23, label %26

23:                                               ; preds = %18
  %24 = add nuw i64 %19, 1
  %25 = icmp eq i64 %24, %16
  br i1 %25, label %26, label %18, !llvm.loop !8

26:                                               ; preds = %23, %18
  %27 = phi i64 [ %16, %23 ], [ %19, %18 ]
  %28 = and i64 %27, 4294967295
  %29 = icmp ugt i64 %16, %28
  br i1 %29, label %30, label %41

30:                                               ; preds = %26, %35
  %31 = phi i64 [ %36, %35 ], [ %28, %26 ]
  %32 = getelementptr inbounds nuw i8, ptr %3, i64 %31
  %33 = load i8, ptr %32, align 1, !tbaa !5
  %34 = icmp eq i8 %33, 98
  br i1 %34, label %35, label %38

35:                                               ; preds = %30
  %36 = add nuw i64 %31, 1
  %37 = icmp eq i64 %36, %16
  br i1 %37, label %38, label %30, !llvm.loop !10

38:                                               ; preds = %35, %30
  %39 = phi i64 [ %16, %35 ], [ %31, %30 ]
  %40 = and i64 %39, 4294967295
  br label %41

41:                                               ; preds = %38, %26
  %42 = phi i64 [ %40, %38 ], [ %28, %26 ]
  %43 = icmp ugt i64 %16, %42
  br i1 %43, label %47, label %52

44:                                               ; preds = %47
  %45 = add nuw i64 %48, 1
  %46 = icmp eq i64 %45, %16
  br i1 %46, label %56, label %47, !llvm.loop !11

47:                                               ; preds = %41, %44
  %48 = phi i64 [ %45, %44 ], [ %42, %41 ]
  %49 = getelementptr inbounds nuw i8, ptr %3, i64 %48
  %50 = load i8, ptr %49, align 1, !tbaa !5
  %51 = icmp eq i8 %50, 99
  br i1 %51, label %44, label %52

52:                                               ; preds = %47, %41
  %53 = phi i64 [ %42, %41 ], [ %48, %47 ]
  %54 = icmp eq i64 %16, %53
  br i1 %54, label %56, label %55

55:                                               ; preds = %52
  call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 28) #9
  unreachable

56:                                               ; preds = %44, %15, %52
  call void @llvm.lifetime.end.p0(i64 10240, ptr nonnull %3) #8
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fileno(ptr nocapture noundef) local_unnamed_addr #6

declare dllimport ptr @__acrt_iob_func(i32 noundef) local_unnamed_addr #5

; Function Attrs: nofree
declare dso_local noundef i32 @open(ptr nocapture noundef readonly, i32 noundef, ...) local_unnamed_addr #7

declare dso_local i32 @close(i32 noundef) local_unnamed_addr #5

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 20.1.7"}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = !{!13, !13, i64 0}
!13 = !{!"p1 omnipotent char", !14, i64 0}
!14 = !{!"any pointer", !6, i64 0}
