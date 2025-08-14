; ModuleID = '451.c'
source_filename = "451.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

@.str = private unnamed_addr constant [9 x i8] c"a == 'a'\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"451.c\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"b == 'b'\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"x != 'a' && x != 'b'\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @f451(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %0) #8
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %24, label %7

4:                                                ; preds = %20
  %5 = add nuw nsw i64 %8, 3
  %6 = icmp ugt i64 %2, %5
  br i1 %6, label %7, label %24, !llvm.loop !5

7:                                                ; preds = %1, %4
  %8 = phi i64 [ %5, %4 ], [ 0, %1 ]
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 %8
  %10 = load i8, ptr %9, align 1, !tbaa !7
  %11 = getelementptr inbounds nuw i8, ptr %9, i64 1
  %12 = load i8, ptr %11, align 1, !tbaa !7
  %13 = icmp eq i8 %10, 97
  br i1 %13, label %15, label %14

14:                                               ; preds = %7
  tail call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 15) #9
  unreachable

15:                                               ; preds = %7
  %16 = getelementptr inbounds nuw i8, ptr %9, i64 2
  %17 = load i8, ptr %16, align 1, !tbaa !7
  %18 = icmp eq i8 %17, 98
  br i1 %18, label %20, label %19

19:                                               ; preds = %15
  tail call void @_assert(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 16) #9
  unreachable

20:                                               ; preds = %15
  %21 = add i8 %12, -99
  %22 = icmp ult i8 %21, -2
  br i1 %22, label %4, label %23

23:                                               ; preds = %20
  tail call void @_assert(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef 17) #9
  unreachable

24:                                               ; preds = %4, %1
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
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %38, label %21

18:                                               ; preds = %34
  %19 = add nuw nsw i64 %22, 3
  %20 = icmp ugt i64 %16, %19
  br i1 %20, label %21, label %38, !llvm.loop !5

21:                                               ; preds = %15, %18
  %22 = phi i64 [ %19, %18 ], [ 0, %15 ]
  %23 = getelementptr inbounds nuw i8, ptr %3, i64 %22
  %24 = load i8, ptr %23, align 1, !tbaa !7
  %25 = getelementptr inbounds nuw i8, ptr %23, i64 1
  %26 = load i8, ptr %25, align 1, !tbaa !7
  %27 = icmp eq i8 %24, 97
  br i1 %27, label %29, label %28

28:                                               ; preds = %21
  call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 15) #9
  unreachable

29:                                               ; preds = %21
  %30 = getelementptr inbounds nuw i8, ptr %23, i64 2
  %31 = load i8, ptr %30, align 1, !tbaa !7
  %32 = icmp eq i8 %31, 98
  br i1 %32, label %34, label %33

33:                                               ; preds = %29
  call void @_assert(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 16) #9
  unreachable

34:                                               ; preds = %29
  %35 = add i8 %26, -99
  %36 = icmp ult i8 %35, -2
  br i1 %36, label %18, label %37

37:                                               ; preds = %34
  call void @_assert(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef 17) #9
  unreachable

38:                                               ; preds = %18, %15
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
