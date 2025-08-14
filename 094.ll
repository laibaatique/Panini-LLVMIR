; ModuleID = '094.c'
source_filename = "094.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"strcmp(t, \22a\22) == 0\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"094.c\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"strlen(s) == 1\00", align 1

; Function Attrs: nounwind uwtable
define dso_local noundef ptr @f094(ptr noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca [2 x i8], align 1
  %3 = load i8, ptr %0, align 1
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %15, label %5

5:                                                ; preds = %1
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %2) #9
  store i8 %3, ptr %2, align 1, !tbaa !5
  %6 = getelementptr inbounds nuw i8, ptr %2, i64 1
  store i8 0, ptr %6, align 1, !tbaa !5
  %7 = call i32 @memcmp(ptr noundef nonnull dereferenceable(2) %2, ptr noundef nonnull dereferenceable(2) @.str, i64 2)
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %5
  tail call void @_assert(ptr noundef nonnull @.str.1, ptr noundef nonnull @.str.2, i32 noundef 13) #10
  unreachable

10:                                               ; preds = %5
  %11 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %0) #9
  %12 = icmp eq i64 %11, 1
  br i1 %12, label %14, label %13

13:                                               ; preds = %10
  tail call void @_assert(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.2, i32 noundef 14) #10
  unreachable

14:                                               ; preds = %10
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %2) #9
  br label %15

15:                                               ; preds = %1, %14
  %16 = phi ptr [ %2, %14 ], [ %0, %1 ]
  ret ptr %16
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare dso_local i64 @strlen(ptr nocapture noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: noreturn
declare dllimport void @_assert(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca [2 x i8], align 1
  %4 = alloca [10240 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 10240, ptr nonnull %4) #9
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(10240) %4, i8 0, i64 10240, i1 false)
  %5 = icmp eq i32 %0, 1
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = tail call ptr @__acrt_iob_func(i32 noundef 0) #9
  %8 = tail call i32 @fileno(ptr noundef %7)
  %9 = call i32 @read(i32 noundef %8, ptr noundef nonnull %4, i32 noundef 10240) #9
  br label %16

10:                                               ; preds = %2
  %11 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %12 = load ptr, ptr %11, align 8, !tbaa !8
  %13 = tail call i32 (ptr, i32, ...) @open(ptr noundef %12, i32 noundef 0) #9
  %14 = call i32 @read(i32 noundef %13, ptr noundef nonnull %4, i32 noundef 10240) #9
  %15 = call i32 @close(i32 noundef %13) #9
  br label %16

16:                                               ; preds = %10, %6
  %17 = load i8, ptr %4, align 16
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %29, label %19

19:                                               ; preds = %16
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %3) #9
  store i8 %17, ptr %3, align 1, !tbaa !5
  %20 = getelementptr inbounds nuw i8, ptr %3, i64 1
  store i8 0, ptr %20, align 1, !tbaa !5
  %21 = call i32 @memcmp(ptr noundef nonnull dereferenceable(2) %3, ptr noundef nonnull dereferenceable(2) @.str, i64 2)
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %24, label %23

23:                                               ; preds = %19
  call void @_assert(ptr noundef nonnull @.str.1, ptr noundef nonnull @.str.2, i32 noundef 13) #10
  unreachable

24:                                               ; preds = %19
  %25 = call i64 @strlen(ptr noundef nonnull readonly dereferenceable(1) %4) #9
  %26 = icmp eq i64 %25, 1
  br i1 %26, label %28, label %27

27:                                               ; preds = %24
  call void @_assert(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.2, i32 noundef 14) #10
  unreachable

28:                                               ; preds = %24
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %3) #9
  br label %29

29:                                               ; preds = %16, %28
  call void @llvm.lifetime.end.p0(i64 10240, ptr nonnull %4) #9
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

; Function Attrs: nofree nounwind willreturn memory(argmem: read)
declare i32 @memcmp(ptr nocapture, ptr nocapture, i64) local_unnamed_addr #8

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind willreturn memory(argmem: read) }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }

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
