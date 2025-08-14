; ModuleID = '442.c'
source_filename = "442.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Exception\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local range(i32 1, 3) i32 @f442(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = load i8, ptr %0, align 1, !tbaa !5
  switch i8 %2, label %13 [
    i8 97, label %3
    i8 99, label %10
  ]

3:                                                ; preds = %1
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 1
  %5 = load i8, ptr %4, align 1, !tbaa !5
  %6 = icmp eq i8 %5, 98
  br i1 %6, label %7, label %13

7:                                                ; preds = %3
  %8 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %0) #9
  %9 = icmp eq i64 %8, 2
  br i1 %9, label %16, label %13

10:                                               ; preds = %1
  %11 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %0) #9
  %12 = icmp eq i64 %11, 1
  br i1 %12, label %16, label %13

13:                                               ; preds = %1, %10, %3, %7
  %14 = tail call ptr @__acrt_iob_func(i32 noundef 2) #9
  %15 = tail call i32 (ptr, ptr, ...) @__mingw_fprintf(ptr noundef %14, ptr noundef nonnull @.str) #9
  tail call void @exit(i32 noundef 1) #10
  unreachable

16:                                               ; preds = %10, %7
  %17 = phi i32 [ 1, %7 ], [ 2, %10 ]
  ret i32 %17
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare dso_local i64 @strlen(ptr nocapture noundef) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local i32 @__mingw_fprintf(ptr noundef, ptr noundef, ...) local_unnamed_addr #2

declare dllimport ptr @__acrt_iob_func(i32 noundef) local_unnamed_addr #3

; Function Attrs: nofree noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca [10240 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 10240, ptr nonnull %3) #9
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(10240) %3, i8 0, i64 10240, i1 false)
  %4 = icmp eq i32 %0, 1
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  %6 = tail call ptr @__acrt_iob_func(i32 noundef 0) #9
  %7 = tail call i32 @fileno(ptr noundef %6)
  %8 = call i32 @read(i32 noundef %7, ptr noundef nonnull %3, i32 noundef 10240) #9
  br label %15

9:                                                ; preds = %2
  %10 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %11 = load ptr, ptr %10, align 8, !tbaa !8
  %12 = tail call i32 (ptr, i32, ...) @open(ptr noundef %11, i32 noundef 0) #9
  %13 = call i32 @read(i32 noundef %12, ptr noundef nonnull %3, i32 noundef 10240) #9
  %14 = call i32 @close(i32 noundef %12) #9
  br label %15

15:                                               ; preds = %9, %5
  %16 = load i8, ptr %3, align 16, !tbaa !5
  switch i8 %16, label %27 [
    i8 97, label %17
    i8 99, label %24
  ]

17:                                               ; preds = %15
  %18 = getelementptr inbounds nuw i8, ptr %3, i64 1
  %19 = load i8, ptr %18, align 1, !tbaa !5
  %20 = icmp eq i8 %19, 98
  br i1 %20, label %21, label %27

21:                                               ; preds = %17
  %22 = call i64 @strlen(ptr noundef nonnull readonly dereferenceable(1) %3) #9
  %23 = icmp eq i64 %22, 2
  br i1 %23, label %30, label %27

24:                                               ; preds = %15
  %25 = call i64 @strlen(ptr noundef nonnull readonly dereferenceable(1) %3) #9
  %26 = icmp eq i64 %25, 1
  br i1 %26, label %30, label %27

27:                                               ; preds = %24, %21, %17, %15
  %28 = call ptr @__acrt_iob_func(i32 noundef 2) #9
  %29 = call i32 (ptr, ptr, ...) @__mingw_fprintf(ptr noundef %28, ptr noundef nonnull @.str) #9
  call void @exit(i32 noundef 1) #10
  unreachable

30:                                               ; preds = %21, %24
  %31 = phi i32 [ 1, %21 ], [ 2, %24 ]
  %32 = call i32 (ptr, ...) @__mingw_printf(ptr noundef nonnull @.str.1, i32 noundef %31) #9
  call void @llvm.lifetime.end.p0(i64 10240, ptr nonnull %3) #9
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fileno(ptr nocapture noundef) local_unnamed_addr #7

; Function Attrs: nofree
declare dso_local noundef i32 @open(ptr nocapture noundef readonly, i32 noundef, ...) local_unnamed_addr #8

declare dso_local i32 @close(i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #5

declare dso_local i32 @__mingw_printf(ptr noundef, ...) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }
attributes #10 = { cold noreturn nounwind }

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
!8 = !{!9, !9, i64 0}
!9 = !{!"p1 omnipotent char", !10, i64 0}
!10 = !{!"any pointer", !6, i64 0}
