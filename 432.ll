; ModuleID = '432.c'
source_filename = "432.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Exception\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"n == 1\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"432.c\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"True\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"False\00", align 1

; Function Attrs: nounwind uwtable
define dso_local noundef zeroext i1 @f432(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = load i8, ptr %0, align 1, !tbaa !5
  %3 = icmp eq i8 %2, 98
  br i1 %3, label %4, label %7

4:                                                ; preds = %1
  %5 = tail call ptr @__acrt_iob_func(i32 noundef 2) #10
  %6 = tail call i32 (ptr, ptr, ...) @__mingw_fprintf(ptr noundef %5, ptr noundef nonnull @.str) #10
  tail call void @exit(i32 noundef 1) #11
  unreachable

7:                                                ; preds = %1
  %8 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %0) #10
  %9 = getelementptr i8, ptr %0, i64 %8
  %10 = getelementptr i8, ptr %9, i64 -1
  %11 = load i8, ptr %10, align 1, !tbaa !5
  %12 = add i8 %11, -97
  %13 = icmp ult i8 %12, 2
  br i1 %13, label %14, label %19

14:                                               ; preds = %7
  %15 = icmp ugt i64 %8, 1
  br i1 %15, label %16, label %22

16:                                               ; preds = %14
  %17 = tail call ptr @__acrt_iob_func(i32 noundef 2) #10
  %18 = tail call i32 (ptr, ptr, ...) @__mingw_fprintf(ptr noundef %17, ptr noundef nonnull @.str) #10
  tail call void @exit(i32 noundef 1) #11
  unreachable

19:                                               ; preds = %7
  %20 = icmp eq i64 %8, 1
  br i1 %20, label %22, label %21

21:                                               ; preds = %19
  tail call void @_assert(ptr noundef nonnull @.str.1, ptr noundef nonnull @.str.2, i32 noundef 23) #12
  unreachable

22:                                               ; preds = %19, %14
  ret i1 %13
}

; Function Attrs: nounwind
declare dso_local i32 @__mingw_fprintf(ptr noundef, ptr noundef, ...) local_unnamed_addr #1

declare dllimport ptr @__acrt_iob_func(i32 noundef) local_unnamed_addr #2

; Function Attrs: nofree noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare dso_local i64 @strlen(ptr nocapture noundef) local_unnamed_addr #5

; Function Attrs: noreturn
declare dllimport void @_assert(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca [10240 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 10240, ptr nonnull %3) #10
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(10240) %3, i8 0, i64 10240, i1 false)
  %4 = icmp eq i32 %0, 1
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  %6 = tail call ptr @__acrt_iob_func(i32 noundef 0) #10
  %7 = tail call i32 @fileno(ptr noundef %6)
  %8 = call i32 @read(i32 noundef %7, ptr noundef nonnull %3, i32 noundef 10240) #10
  br label %15

9:                                                ; preds = %2
  %10 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %11 = load ptr, ptr %10, align 8, !tbaa !8
  %12 = tail call i32 (ptr, i32, ...) @open(ptr noundef %11, i32 noundef 0) #10
  %13 = call i32 @read(i32 noundef %12, ptr noundef nonnull %3, i32 noundef 10240) #10
  %14 = call i32 @close(i32 noundef %12) #10
  br label %15

15:                                               ; preds = %9, %5
  %16 = call zeroext i1 @f432(ptr noundef nonnull %3)
  %17 = select i1 %16, ptr @.str.4, ptr @.str.5
  %18 = call i32 (ptr, ...) @__mingw_printf(ptr noundef nonnull @.str.3, ptr noundef nonnull %17) #10
  call void @llvm.lifetime.end.p0(i64 10240, ptr nonnull %3) #10
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #7

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fileno(ptr nocapture noundef) local_unnamed_addr #8

; Function Attrs: nofree
declare dso_local noundef i32 @open(ptr nocapture noundef readonly, i32 noundef, ...) local_unnamed_addr #9

declare dso_local i32 @close(i32 noundef) local_unnamed_addr #2

declare dso_local i32 @__mingw_printf(ptr noundef, ...) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #8 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind }
attributes #11 = { cold noreturn nounwind }
attributes #12 = { noreturn nounwind }

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
