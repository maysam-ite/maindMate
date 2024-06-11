import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/main.dart';

class BookAConsultationWidget extends StatelessWidget {
  const BookAConsultationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: appTheme.primaryBackground, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5), spreadRadius: 1, blurRadius: 5)
      ]),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle),
                child: Image.asset(
                  'assets/images/Component 2 – 2.png',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: 10.w,
                height: 10.w,
                decoration:
                    BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              )
            ],
          )
        ],
      ),
    );
  }
}
