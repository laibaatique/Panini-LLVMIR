; ModuleID = 'cgidecode.c'
source_filename = "cgidecode.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

@hex_values = dso_local local_unnamed_addr global [256 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @init_hex_values() local_unnamed_addr #0 {
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1024) @hex_values, i8 -1, i64 1024, i1 false), !tbaa !5
  store <4 x i32> <i32 0, i32 1, i32 2, i32 3>, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 192), align 16, !tbaa !5
  store <4 x i32> <i32 4, i32 5, i32 6, i32 7>, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 208), align 16, !tbaa !5
  store i32 8, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 224), align 16, !tbaa !5
  store i32 9, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 228), align 4, !tbaa !5
  store <4 x i32> <i32 10, i32 11, i32 12, i32 13>, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 388), align 4, !tbaa !5
  store i32 14, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 404), align 4, !tbaa !5
  store i32 15, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 408), align 8, !tbaa !5
  store <4 x i32> <i32 10, i32 11, i32 12, i32 13>, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 260), align 4, !tbaa !5
  store i32 14, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 276), align 4, !tbaa !5
  store i32 15, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 280), align 8, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable
define dso_local range(i32 -1, 1) i32 @cgidecode(ptr nocapture noundef readonly %0, ptr nocapture noundef writeonly %1) local_unnamed_addr #2 {
  br label %3

3:                                                ; preds = %26, %2
  %4 = phi ptr [ %1, %2 ], [ %29, %26 ]
  %5 = phi ptr [ %0, %2 ], [ %30, %26 ]
  %6 = load i8, ptr %5, align 1, !tbaa !9
  switch i8 %6, label %25 [
    i8 0, label %31
    i8 43, label %26
    i8 37, label %7
  ]

7:                                                ; preds = %3
  %8 = getelementptr inbounds nuw i8, ptr %5, i64 1
  %9 = load i8, ptr %8, align 1, !tbaa !9
  %10 = getelementptr inbounds nuw i8, ptr %5, i64 2
  %11 = sext i8 %9 to i64
  %12 = getelementptr inbounds [256 x i32], ptr @hex_values, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4, !tbaa !5
  %14 = icmp sgt i32 %13, -1
  br i1 %14, label %15, label %32

15:                                               ; preds = %7
  %16 = load i8, ptr %10, align 1, !tbaa !9
  %17 = sext i8 %16 to i64
  %18 = getelementptr inbounds [256 x i32], ptr @hex_values, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4, !tbaa !5
  %20 = icmp sgt i32 %19, -1
  br i1 %20, label %21, label %32

21:                                               ; preds = %15
  %22 = shl nsw i32 %13, 4
  %23 = add nuw nsw i32 %19, %22
  %24 = trunc i32 %23 to i8
  br label %26

25:                                               ; preds = %3
  br label %26

26:                                               ; preds = %3, %21, %25
  %27 = phi i8 [ %24, %21 ], [ %6, %25 ], [ 32, %3 ]
  %28 = phi ptr [ %10, %21 ], [ %5, %25 ], [ %5, %3 ]
  store i8 %27, ptr %4, align 1, !tbaa !9
  %29 = getelementptr inbounds nuw i8, ptr %4, i64 1
  %30 = getelementptr inbounds nuw i8, ptr %28, i64 1
  br label %3, !llvm.loop !10

31:                                               ; preds = %3
  store i8 0, ptr %4, align 1, !tbaa !9
  br label %32

32:                                               ; preds = %7, %15, %31
  %33 = phi i32 [ 0, %31 ], [ -1, %15 ], [ -1, %7 ]
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define dso_local range(i32 -1, 1) i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #3 {
  %3 = alloca [10240 x i8], align 16
  %4 = alloca [10240 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 10240, ptr nonnull %3) #8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(10240) %3, i8 0, i64 10240, i1 false)
  %5 = icmp eq i32 %0, 1
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = tail call ptr @__acrt_iob_func(i32 noundef 0) #8
  %8 = tail call i32 @fileno(ptr noundef %7)
  %9 = call i32 @read(i32 noundef %8, ptr noundef nonnull %3, i32 noundef 10240) #8
  br label %16

10:                                               ; preds = %2
  %11 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %12 = load ptr, ptr %11, align 8, !tbaa !12
  %13 = tail call i32 (ptr, i32, ...) @open(ptr noundef %12, i32 noundef 0) #8
  %14 = call i32 @read(i32 noundef %13, ptr noundef nonnull %3, i32 noundef 10240) #8
  %15 = call i32 @close(i32 noundef %13) #8
  br label %16

16:                                               ; preds = %10, %6
  call void @llvm.lifetime.start.p0(i64 10240, ptr nonnull %4) #8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1024) @hex_values, i8 -1, i64 1024, i1 false), !tbaa !5
  store <4 x i32> <i32 0, i32 1, i32 2, i32 3>, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 192), align 16, !tbaa !5
  store <4 x i32> <i32 4, i32 5, i32 6, i32 7>, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 208), align 16, !tbaa !5
  store i32 8, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 224), align 16, !tbaa !5
  store i32 9, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 228), align 4, !tbaa !5
  store <4 x i32> <i32 10, i32 11, i32 12, i32 13>, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 388), align 4, !tbaa !5
  store i32 14, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 404), align 4, !tbaa !5
  store i32 15, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 408), align 8, !tbaa !5
  store <4 x i32> <i32 10, i32 11, i32 12, i32 13>, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 260), align 4, !tbaa !5
  store i32 14, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 276), align 4, !tbaa !5
  store i32 15, ptr getelementptr inbounds nuw (i8, ptr @hex_values, i64 280), align 8, !tbaa !5
  br label %17

17:                                               ; preds = %40, %16
  %18 = phi ptr [ %4, %16 ], [ %43, %40 ]
  %19 = phi ptr [ %3, %16 ], [ %44, %40 ]
  %20 = load i8, ptr %19, align 1, !tbaa !9
  switch i8 %20, label %39 [
    i8 0, label %45
    i8 43, label %40
    i8 37, label %21
  ]

21:                                               ; preds = %17
  %22 = getelementptr inbounds nuw i8, ptr %19, i64 1
  %23 = load i8, ptr %22, align 1, !tbaa !9
  %24 = getelementptr inbounds nuw i8, ptr %19, i64 2
  %25 = sext i8 %23 to i64
  %26 = getelementptr inbounds [256 x i32], ptr @hex_values, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4, !tbaa !5
  %28 = icmp sgt i32 %27, -1
  br i1 %28, label %29, label %46

29:                                               ; preds = %21
  %30 = load i8, ptr %24, align 1, !tbaa !9
  %31 = sext i8 %30 to i64
  %32 = getelementptr inbounds [256 x i32], ptr @hex_values, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4, !tbaa !5
  %34 = icmp sgt i32 %33, -1
  br i1 %34, label %35, label %46

35:                                               ; preds = %29
  %36 = shl nsw i32 %27, 4
  %37 = add nuw nsw i32 %33, %36
  %38 = trunc i32 %37 to i8
  br label %40

39:                                               ; preds = %17
  br label %40

40:                                               ; preds = %39, %35, %17
  %41 = phi i8 [ %38, %35 ], [ %20, %39 ], [ 32, %17 ]
  %42 = phi ptr [ %24, %35 ], [ %19, %39 ], [ %19, %17 ]
  store i8 %41, ptr %18, align 1, !tbaa !9
  %43 = getelementptr inbounds nuw i8, ptr %18, i64 1
  %44 = getelementptr inbounds nuw i8, ptr %42, i64 1
  br label %17, !llvm.loop !10

45:                                               ; preds = %17
  store i8 0, ptr %18, align 1, !tbaa !9
  br label %46

46:                                               ; preds = %21, %29, %45
  %47 = phi i32 [ 0, %45 ], [ -1, %29 ], [ -1, %21 ]
  call void @llvm.lifetime.end.p0(i64 10240, ptr nonnull %4) #8
  call void @llvm.lifetime.end.p0(i64 10240, ptr nonnull %3) #8
  ret i32 %47
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 20.1.7"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"p1 omnipotent char", !14, i64 0}
!14 = !{!"any pointer", !7, i64 0}
