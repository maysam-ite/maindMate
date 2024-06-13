import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/main.dart';

class ExperienceOfOthersWidget extends StatelessWidget {
  const ExperienceOfOthersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/ExperienceDetailesScreen');
      },
      child: Container(
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
          children: [PostHeader(), PostContent()],
        ),
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
        Container(
          width: 33.w,
          height: 33.h,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.blue)),
          child: Image.asset('assets/images/Component 2 – 2.png'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'أحمد محمد احمد',
              style: appTheme.text16,
            ),
            Text(
              'المنصب او الاشتراك',
              style: appTheme.text10,
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 38.w,
          height: 38.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: appTheme.lineColor.withOpacity(0.5)),
          child: const Icon(Icons.star_border_outlined),
        ),
        Container(
          width: 38.w,
          height: 38.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: appTheme.lineColor.withOpacity(0.5)),
          child: const Icon(Icons.star_border_outlined),
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
        Text(
          "يسنتلنتلاناشلالنلالنتاشيلمنىلاشاضتشنلال ع لاعلاع اعااضلنال ضعالضعلاضعلاضع لاضعلاضلاضعلا ضلضعلاضعلا علاعلاضعلاضخعلاعلاعل اضعلاضلعهاضلعاضعهلا قل قلضعلاضعلعقال عهضالعقللاعاضقعضعق",
          style: appTheme.text18.copyWith(fontSize: 16),
        ),
        Container(
          height: 195.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
          child: Image.asset(
            'assets/images/post.png',
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}
