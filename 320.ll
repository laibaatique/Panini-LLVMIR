; ModuleID = '320.c'
source_filename = "320.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

@.str = private unnamed_addr constant [12 x i8] c"s[0] == 'a'\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"320.c\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"s[2] == 'b'\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"strlen(s) == 3\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @f320(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = load i8, ptr %0, align 1, !tbaa !5
  %3 = icmp eq i8 %2, 97
  br i1 %3, label %5, label %4

4:                                                ; preds = %1
  tail call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 9) #8
  unreachable

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 2
  %7 = load i8, ptr %6, align 1, !tbaa !5
  %8 = icmp eq i8 %7, 98
  br i1 %8, label %10, label %9

9:                                                ; preds = %5
  tail call void @_assert(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 10) #8
  unreachable

10:                                               ; preds = %5
  %11 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %0) #9
  %12 = icmp eq i64 %11, 3
  br i1 %12, label %14, label %13

13:                                               ; preds = %10
  tail call void @_assert(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef 11) #8
  unreachable

14:                                               ; preds = %10
  ret void
}

; Function Attrs: noreturn
declare dllimport void @_assert(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare dso_local i64 @strlen(ptr nocapture noundef) local_unnamed_addr #2

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
  %17 = icmp eq i8 %16, 97
  br i1 %17, label %19, label %18

18:                                               ; preds = %15
  call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 9) #8
  unreachable

19:                                               ; preds = %15
  %20 = getelementptr inbounds nuw i8, ptr %3, i64 2
  %21 = load i8, ptr %20, align 2, !tbaa !5
  %22 = icmp eq i8 %21, 98
  br i1 %22, label %24, label %23

23:                                               ; preds = %19
  call void @_assert(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 10) #8
  unreachable

24:                                               ; preds = %19
  %25 = call i64 @strlen(ptr noundef nonnull readonly dereferenceable(1) %3) #9
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %28, label %27

27:                                               ; preds = %24
  call void @_assert(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef 11) #8
  unreachable

28:                                               ; preds = %24
  call void @llvm.lifetime.end.p0(i64 10240, ptr nonnull %3) #9
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fileno(ptr nocapture noundef) local_unnamed_addr #6

declare dllimport ptr @__acrt_iob_func(i32 noundef) local_unnamed_addr #5

; Function Attrs: nofree
declare dso_local noundef i32 @open(ptr nocapture noundef readonly, i32 noundef, ...) local_unnamed_addr #7

declare dso_local i32 @close(i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }

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
