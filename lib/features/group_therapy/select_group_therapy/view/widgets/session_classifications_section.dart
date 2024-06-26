import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/main.dart';

class SessionClassificationSection extends StatelessWidget {
  const SessionClassificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تصنيفات الجلسات',
            style: appTheme.text12,
          ),
          Center(
            child: Wrap(
              spacing: 15,
              runSpacing: 10,
              children:
                  List.generate(7, (index) => SessionClassificationCard()),
            ),
          )
        ].divide(SizedBox(
          height: 10,
        )),
      ),
    );
  }
}

class SessionClassificationCard extends StatelessWidget {
  const SessionClassificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed('/SpcificeGroupTherapyTypeScreen',arguments: 'القلق',preventDuplicates:false );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        width: 100.w,
        height: 80.h,
        decoration: BoxDecoration(
            color: appTheme.primaryBackground,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
              )
            ],
            border: Border.all(color: appTheme.secondary),
            borderRadius: BorderRadius.circular(13.r)),
        child: Text(
          ' الاضطراب النفسي',
          style: appTheme.text14,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
