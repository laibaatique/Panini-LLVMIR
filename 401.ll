; ModuleID = '401.c'
source_filename = "401.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-w64-windows-gnu"

@.str = private unnamed_addr constant [35 x i8] c"ca == strlen(s) || cb == strlen(s)\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"401.c\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @f401(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %0) #9
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %65, label %4

4:                                                ; preds = %1
  %5 = icmp ult i64 %2, 8
  br i1 %5, label %38, label %6

6:                                                ; preds = %4
  %7 = and i64 %2, -8
  br label %8

8:                                                ; preds = %8, %6
  %9 = phi i64 [ 0, %6 ], [ %30, %8 ]
  %10 = phi <4 x i32> [ zeroinitializer, %6 ], [ %28, %8 ]
  %11 = phi <4 x i32> [ zeroinitializer, %6 ], [ %29, %8 ]
  %12 = phi <4 x i32> [ zeroinitializer, %6 ], [ %22, %8 ]
  %13 = phi <4 x i32> [ zeroinitializer, %6 ], [ %23, %8 ]
  %14 = getelementptr inbounds nuw i8, ptr %0, i64 %9
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 4
  %16 = load <4 x i8>, ptr %14, align 1, !tbaa !5
  %17 = load <4 x i8>, ptr %15, align 1, !tbaa !5
  %18 = icmp eq <4 x i8> %16, splat (i8 97)
  %19 = icmp eq <4 x i8> %17, splat (i8 97)
  %20 = zext <4 x i1> %18 to <4 x i32>
  %21 = zext <4 x i1> %19 to <4 x i32>
  %22 = add <4 x i32> %12, %20
  %23 = add <4 x i32> %13, %21
  %24 = icmp eq <4 x i8> %16, splat (i8 98)
  %25 = icmp eq <4 x i8> %17, splat (i8 98)
  %26 = zext <4 x i1> %24 to <4 x i32>
  %27 = zext <4 x i1> %25 to <4 x i32>
  %28 = add <4 x i32> %10, %26
  %29 = add <4 x i32> %11, %27
  %30 = add nuw i64 %9, 8
  %31 = icmp eq i64 %30, %7
  br i1 %31, label %32, label %8, !llvm.loop !8

32:                                               ; preds = %8
  %33 = add <4 x i32> %29, %28
  %34 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %33)
  %35 = add <4 x i32> %23, %22
  %36 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %35)
  %37 = icmp eq i64 %2, %7
  br i1 %37, label %56, label %38

38:                                               ; preds = %4, %32
  %39 = phi i64 [ 0, %4 ], [ %7, %32 ]
  %40 = phi i32 [ 0, %4 ], [ %34, %32 ]
  %41 = phi i32 [ 0, %4 ], [ %36, %32 ]
  br label %42

42:                                               ; preds = %38, %42
  %43 = phi i64 [ %54, %42 ], [ %39, %38 ]
  %44 = phi i32 [ %53, %42 ], [ %40, %38 ]
  %45 = phi i32 [ %50, %42 ], [ %41, %38 ]
  %46 = getelementptr inbounds nuw i8, ptr %0, i64 %43
  %47 = load i8, ptr %46, align 1, !tbaa !5
  %48 = icmp eq i8 %47, 97
  %49 = zext i1 %48 to i32
  %50 = add nuw nsw i32 %45, %49
  %51 = icmp eq i8 %47, 98
  %52 = zext i1 %51 to i32
  %53 = add nuw nsw i32 %44, %52
  %54 = add nuw nsw i64 %43, 1
  %55 = icmp eq i64 %54, %2
  br i1 %55, label %56, label %42, !llvm.loop !12

56:                                               ; preds = %42, %32
  %57 = phi i32 [ %36, %32 ], [ %50, %42 ]
  %58 = phi i32 [ %34, %32 ], [ %53, %42 ]
  %59 = zext nneg i32 %57 to i64
  %60 = zext nneg i32 %58 to i64
  %61 = icmp eq i64 %2, %59
  %62 = icmp eq i64 %2, %60
  %63 = select i1 %61, i1 true, i1 %62
  br i1 %63, label %65, label %64

64:                                               ; preds = %56
  tail call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 21) #10
  unreachable

65:                                               ; preds = %1, %56
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
  %11 = load ptr, ptr %10, align 8, !tbaa !13
  %12 = tail call i32 (ptr, i32, ...) @open(ptr noundef %11, i32 noundef 0) #9
  %13 = call i32 @read(i32 noundef %12, ptr noundef nonnull %3, i32 noundef 10240) #9
  %14 = call i32 @close(i32 noundef %12) #9
  br label %15

15:                                               ; preds = %9, %5
  %16 = call i64 @strlen(ptr noundef nonnull readonly dereferenceable(1) %3) #9
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %79, label %18

18:                                               ; preds = %15
  %19 = icmp ult i64 %16, 8
  br i1 %19, label %52, label %20

20:                                               ; preds = %18
  %21 = and i64 %16, -8
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i64 [ 0, %20 ], [ %44, %22 ]
  %24 = phi <4 x i32> [ zeroinitializer, %20 ], [ %42, %22 ]
  %25 = phi <4 x i32> [ zeroinitializer, %20 ], [ %43, %22 ]
  %26 = phi <4 x i32> [ zeroinitializer, %20 ], [ %36, %22 ]
  %27 = phi <4 x i32> [ zeroinitializer, %20 ], [ %37, %22 ]
  %28 = getelementptr inbounds nuw i8, ptr %3, i64 %23
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 4
  %30 = load <4 x i8>, ptr %28, align 8, !tbaa !5
  %31 = load <4 x i8>, ptr %29, align 4, !tbaa !5
  %32 = icmp eq <4 x i8> %30, splat (i8 97)
  %33 = icmp eq <4 x i8> %31, splat (i8 97)
  %34 = zext <4 x i1> %32 to <4 x i32>
  %35 = zext <4 x i1> %33 to <4 x i32>
  %36 = add <4 x i32> %26, %34
  %37 = add <4 x i32> %27, %35
  %38 = icmp eq <4 x i8> %30, splat (i8 98)
  %39 = icmp eq <4 x i8> %31, splat (i8 98)
  %40 = zext <4 x i1> %38 to <4 x i32>
  %41 = zext <4 x i1> %39 to <4 x i32>
  %42 = add <4 x i32> %24, %40
  %43 = add <4 x i32> %25, %41
  %44 = add nuw i64 %23, 8
  %45 = icmp eq i64 %44, %21
  br i1 %45, label %46, label %22, !llvm.loop !16

46:                                               ; preds = %22
  %47 = add <4 x i32> %43, %42
  %48 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %47)
  %49 = add <4 x i32> %37, %36
  %50 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %49)
  %51 = icmp eq i64 %16, %21
  br i1 %51, label %70, label %52

52:                                               ; preds = %18, %46
  %53 = phi i64 [ 0, %18 ], [ %21, %46 ]
  %54 = phi i32 [ 0, %18 ], [ %48, %46 ]
  %55 = phi i32 [ 0, %18 ], [ %50, %46 ]
  br label %56

56:                                               ; preds = %52, %56
  %57 = phi i64 [ %68, %56 ], [ %53, %52 ]
  %58 = phi i32 [ %67, %56 ], [ %54, %52 ]
  %59 = phi i32 [ %64, %56 ], [ %55, %52 ]
  %60 = getelementptr inbounds nuw i8, ptr %3, i64 %57
  %61 = load i8, ptr %60, align 1, !tbaa !5
  %62 = icmp eq i8 %61, 97
  %63 = zext i1 %62 to i32
  %64 = add nuw nsw i32 %59, %63
  %65 = icmp eq i8 %61, 98
  %66 = zext i1 %65 to i32
  %67 = add nuw nsw i32 %58, %66
  %68 = add nuw nsw i64 %57, 1
  %69 = icmp eq i64 %68, %16
  br i1 %69, label %70, label %56, !llvm.loop !17

70:                                               ; preds = %56, %46
  %71 = phi i32 [ %50, %46 ], [ %64, %56 ]
  %72 = phi i32 [ %48, %46 ], [ %67, %56 ]
  %73 = zext nneg i32 %71 to i64
  %74 = zext nneg i32 %72 to i64
  %75 = icmp eq i64 %16, %73
  %76 = icmp eq i64 %16, %74
  %77 = select i1 %75, i1 true, i1 %76
  br i1 %77, label %79, label %78

78:                                               ; preds = %70
  call void @_assert(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 21) #10
  unreachable

79:                                               ; preds = %15, %70
  call void @llvm.lifetime.end.p0(i64 10240, ptr nonnull %3) #9
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

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #8

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
!8 = distinct !{!8, !9, !10, !11}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
!12 = distinct !{!12, !9, !11, !10}
!13 = !{!14, !14, i64 0}
!14 = !{!"p1 omnipotent char", !15, i64 0}
!15 = !{!"any pointer", !6, i64 0}
!16 = distinct !{!16, !9, !10, !11}
!17 = distinct !{!17, !9, !11, !10}
