; ModuleID = '990_lsb_check.c'
source_filename = "990_lsb_check.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

@.str = private unnamed_addr constant [12 x i8] c"s[i] == '0'\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"990_lsb_check.c\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"s[i] == '1'\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @f990_lsb_check(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %0) #8
  %3 = add i64 %2, -1
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %14, label %8

5:                                                ; preds = %8
  %6 = add nuw i64 %9, 1
  %7 = icmp eq i64 %6, %3
  br i1 %7, label %14, label %8, !llvm.loop !5

8:                                                ; preds = %1, %5
  %9 = phi i64 [ %6, %5 ], [ 0, %1 ]
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 %9
  %11 = load i8, ptr %10, align 1, !tbaa !7
  %12 = icmp eq i8 %11, 48
  br i1 %12, label %5, label %13

13:                                               ; preds = %8
  tail call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 11) #9
  unreachable

14:                                               ; preds = %5, %1
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 %3
  %16 = load i8, ptr %15, align 1, !tbaa !7
  %17 = icmp eq i8 %16, 49
  br i1 %17, label %19, label %18

18:                                               ; preds = %14
  tail call void @_assert(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 14) #9
  unreachable

19:                                               ; preds = %14
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
  %11 = load ptr, ptr %10, align 8, !tbaa !10
  %12 = tail call i32 (ptr, i32, ...) @open(ptr noundef %11, i32 noundef 0) #8
  %13 = call i32 @read(i32 noundef %12, ptr noundef nonnull %3, i32 noundef 10240) #8
  %14 = call i32 @close(i32 noundef %12) #8
  br label %15

15:                                               ; preds = %9, %5
  %16 = call i64 @strlen(ptr noundef nonnull readonly dereferenceable(1) %3) #8
  %17 = add i64 %16, -1
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %28, label %22

19:                                               ; preds = %22
  %20 = add nuw i64 %23, 1
  %21 = icmp eq i64 %20, %17
  br i1 %21, label %28, label %22, !llvm.loop !5

22:                                               ; preds = %15, %19
  %23 = phi i64 [ %20, %19 ], [ 0, %15 ]
  %24 = getelementptr inbounds nuw i8, ptr %3, i64 %23
  %25 = load i8, ptr %24, align 1, !tbaa !7
  %26 = icmp eq i8 %25, 48
  br i1 %26, label %19, label %27

27:                                               ; preds = %22
  call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 11) #9
  unreachable

28:                                               ; preds = %19, %15
  %29 = getelementptr inbounds nuw i8, ptr %3, i64 %17
  %30 = load i8, ptr %29, align 1, !tbaa !7
  %31 = icmp eq i8 %30, 49
  br i1 %31, label %33, label %32

32:                                               ; preds = %28
  call void @_assert(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 14) #9
  unreachable

33:                                               ; preds = %28
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"p1 omnipotent char", !12, i64 0}
!12 = !{!"any pointer", !8, i64 0}
