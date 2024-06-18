import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/features/Consultations/book_a_consultation/view/widgets/book_a_consiltation_widget_header.dart';
import 'package:maindmate/main.dart';

class ActiveSessionsList extends StatelessWidget {
  const ActiveSessionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الجلسات القائمة حالياً',
          style: appTheme.text12,
        ),
        SizedBox(
          height: 260.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(3, (index) => const ActiveSessionCard())
                  .divide(const SizedBox(width: 15)),
            ),
          ),
        ),
      ],
    );
  }
}

class ActiveSessionCard extends StatelessWidget {
  const ActiveSessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 250.h,
      decoration: BoxDecoration(
        color: appTheme.primaryBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: [
          _buildTopHalf(),
          _buildBottomHalf(),
          _buildCardContent(),
        ],
      ),
    );
  }

  Positioned _buildTopHalf() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 160.h,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    );
  }

  Positioned _buildBottomHalf() {
    return Positioned(
      top: 100.h,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.primaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
    );
  }

  Padding _buildCardContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'عنوان الجلسة العام',
            style: appTheme.text18.copyWith(color: appTheme.primaryBtnText),
          ),
          SizedBox(height: 10.h),
          _buildUserRow(),
          SizedBox(height: 5.h),
          _buildSpecializationSection(),
          const Divider(),
          _buildSessionTimeDetailes()
        ],
      ),
    );
  }

  Widget _buildSessionTimeDetailes() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset('assets/images/stopwatch.png'),
            Text(
              'بدأت',
              style: appTheme.text12,
            ),
            Text('05:00 PM', style: appTheme.text12),
            const Spacer(),
            Text('تنتهي بعد 1 ساعة', style: appTheme.text12),
          ].divide(const SizedBox(
            width: 3,
          )),
        ),
        Row(
          children: [
            Image.asset('assets/images/whatsapp.png'),
            Image.asset('assets/images/telegram.png'),
            Image.asset('assets/images/googlemeet.png'),
            Image.asset('assets/images/zoom.png'),
            const Spacer(),
            Text(
              'الدخول',
              style: appTheme.text14.copyWith(fontWeight: FontWeight.normal),
            ),
            Image.asset(
              'assets/images/enter-outline.png',
              width: 30,
            ),
          ].divide(const SizedBox(
            width: 5,
          )),
        )
      ].divide(const SizedBox(
        height: 10,
      )),
    );
  }

  Widget _buildSpecializationSection() {
    return Wrap(
      spacing: 5,
      runSpacing: 3,
      children: [
        ...List.generate(
            3,

            /// TODO ADD CONDITION FOR MAX 3 ELEMENT
            (index) => const SpecializationCard(
                  title: 'اضطرابات القلق',
                ))
      ].divide(const SizedBox(
        height: 5,
      )),
    );
  }

  Row _buildUserRow() {
    return Row(
      children: [
        const UserPhoto(),
        SizedBox(width: 7.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'عبد الله خالد',
              style: appTheme.text16.copyWith(color: appTheme.primaryBtnText),
            ),
            const SizedBox(height: 10),
            Text(
              'طيب نفسي',
              style: appTheme.text12.copyWith(color: appTheme.secondary),
            ),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset('assets/images/Group 204.png'),
            ),
            const SizedBox(height: 10),
            Text('05', style: appTheme.text12),
          ],
        ),
      ],
    );
  }
}

class UserPhoto extends StatelessWidget {
  const UserPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 60.w,
          height: 60.w,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: appTheme.lineColor),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/Component.png',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 2,
          bottom: 2,
          child: Container(
            width: 10.w,
            height: 10.w,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
