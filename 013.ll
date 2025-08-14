; ModuleID = '013.c'
source_filename = "013.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

@.str = private unnamed_addr constant [15 x i8] c"strlen(t) <= 1\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"013.c\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @f013(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca [2 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %2) #8
  %3 = load i8, ptr %0, align 1
  store i8 %3, ptr %2, align 1
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 1
  store i8 0, ptr %4, align 1, !tbaa !5
  %5 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %2) #8
  %6 = icmp ult i64 %5, 2
  br i1 %6, label %8, label %7

7:                                                ; preds = %1
  tail call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 12) #9
  unreachable

8:                                                ; preds = %1
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %2) #8
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
  %3 = alloca [2 x i8], align 1
  %4 = alloca [10240 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 10240, ptr nonnull %4) #8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(10240) %4, i8 0, i64 10240, i1 false)
  %5 = icmp eq i32 %0, 1
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = tail call ptr @__acrt_iob_func(i32 noundef 0) #8
  %8 = tail call i32 @fileno(ptr noundef %7)
  %9 = call i32 @read(i32 noundef %8, ptr noundef nonnull %4, i32 noundef 10240) #8
  br label %16

10:                                               ; preds = %2
  %11 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %12 = load ptr, ptr %11, align 8, !tbaa !8
  %13 = tail call i32 (ptr, i32, ...) @open(ptr noundef %12, i32 noundef 0) #8
  %14 = call i32 @read(i32 noundef %13, ptr noundef nonnull %4, i32 noundef 10240) #8
  %15 = call i32 @close(i32 noundef %13) #8
  br label %16

16:                                               ; preds = %10, %6
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %3) #8
  %17 = load i8, ptr %4, align 16
  store i8 %17, ptr %3, align 1
  %18 = getelementptr inbounds nuw i8, ptr %3, i64 1
  store i8 0, ptr %18, align 1, !tbaa !5
  %19 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %3) #8
  %20 = icmp ult i64 %19, 2
  br i1 %20, label %22, label %21

21:                                               ; preds = %16
  call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 12) #9
  unreachable

22:                                               ; preds = %16
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %3) #8
  call void @llvm.lifetime.end.p0(i64 10240, ptr nonnull %4) #8
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
!8 = !{!9, !9, i64 0}
!9 = !{!"p1 omnipotent char", !10, i64 0}
!10 = !{!"any pointer", !6, i64 0}
