import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/animation/shimmer_animation.dart';
import 'package:maindmate/main.dart';
Widget buildLoadingStoriesList(){
  return SingleChildScrollView(
     padding: const EdgeInsets.symmetric(horizontal: 10),
         
    child: Column(children: [
    ...List.generate(3,(index)=>StoriesLoadingWidget())
    ].divide(SizedBox(height: 5.h,)),),
  );
}
class StoriesLoadingWidget extends StatelessWidget {
  const StoriesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      decoration: BoxDecoration(
          color: appTheme.primaryBackground,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5)
          ]),
      padding: const EdgeInsets.all(10),
      child: const Column(
        children: [PostHeader(), SizedBox(height: 5,),PostContent()],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShimmerLoadingWidget(
          loadingShimmerWidget: Container(
            width: 33.w,
            height: 33.h,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: appTheme.lineColor.withOpacity(0.5))),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ShimmerLoadingWidget(loadingShimmerWidget:        Container(
          width: 60,
          height: 10,
          color: appTheme.lineColor.withOpacity(0.5),
        ),
    ),
            ShimmerLoadingWidget(loadingShimmerWidget:        Container(
          width: 80,
          height: 10,
          color: appTheme.lineColor.withOpacity(0.5),
        ),
    ),
        
            ].divide(SizedBox(height: 5,)),
        ),
        const Spacer(),
        ShimmerLoadingWidget(
          loadingShimmerWidget: Container(
            width: 38.w,
            height: 38.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: appTheme.lineColor.withOpacity(0.5)),
            
          ),
        ),
        ShimmerLoadingWidget(
          loadingShimmerWidget: Container(
            width: 38.w,
            height: 38.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: appTheme.lineColor.withOpacity(0.5)),
          
          ),
        )
      ].divide(SizedBox(
        width: 10.w,
      )),
    );
  }
}

class PostContent extends StatelessWidget {
  const PostContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerLoadingWidget(
loadingShimmerWidget: Container(
            width: 350,
            height: 10,
            color: appTheme.lineColor.withOpacity(0.5),
          ),
        ),
        ShimmerLoadingWidget(
loadingShimmerWidget: Container(
            width: 340,
            height: 10,
            color: appTheme.lineColor.withOpacity(0.5),
          ),
        ),
        ShimmerLoadingWidget(
loadingShimmerWidget: Container(
            width: 250,
            height: 10,
            color: appTheme.lineColor.withOpacity(0.5),
          ),
        ),
       
        ShimmerLoadingWidget(
            loadingShimmerWidget: Container(
            height: 195.h,
            decoration: BoxDecoration(
              color:appTheme.lineColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15.sp)),
          ),
        )
      ].divide(SizedBox(height:10)),
    );
  }
}
