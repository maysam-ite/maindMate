import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/main.dart';

class StoryDetailesScreen extends StatelessWidget {
  const StoryDetailesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/Component 2 – 2.png',
                width: 30,
                height: 30,
              ),
            ),
          ],
          title: Text('Centered Title'),
          surfaceTintColor: appTheme.primaryBackground,
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 275.h,
              // decoration:
              //     BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
              child: Image.asset(
                'assets/images/post.png',
                fit: BoxFit.cover,
              ),
            ),
            const PostHeader()
          ],
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: appTheme.primaryBackground,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5)
          ]),
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 33.w,
                height: 33.h,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
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
          ),
          Text(
            "يسنتلنتلاناشلالنلالنتاشيلمنىلاشاضتشنلال ع لاعلاع اعااضلنال ضعالضعلاضعلاضع لاضعلاضلاضعلا ضلضعلاضعلا علاعلاضعلاضخعلاعلاعل اضعلاضلعهاضلعاضعهلا قل قلضعلاضعلعقال عهضالعقللاعاضقعضعق",
            style: appTheme.text18,
          ),
        ],
      ),
    );
  }
}
