import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/widgets/rating/rating_row_widget.dart';
import 'package:maindmate/main.dart';

class WidgetHeader extends StatelessWidget {
  const WidgetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UserPhoto(),
        const SizedBox(
          width: 5,
        ),
        const UserDetailes(),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...List.generate(
                3,
                (index) => const SpecializationCard(
                      title: 'اضطرابات القلق',
                    ))
          ].divide(const SizedBox(
            height: 5,
          )),
        ),
      ],
    );
  }
}

class UserDetailes extends StatelessWidget {
  const UserDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'عبد الله خالد',
          style: appTheme.text16,
        ),
        Text(
          'طيب نفسي',
          style: appTheme.text12.copyWith(color: appTheme.secondary),
        ),
        StarRating(
          rating: 3.5,
          maxRating: 5,
        ),
        Text(
          '200 تقييم/ 4.5',
          style: appTheme.text12.copyWith(),
        ),
        Text(
          '200 جلسة',
          style: appTheme.text12.copyWith(color: appTheme.secondary),
        ),
      ],
    );
  }
}

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    super.key,
  });

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
              shape: BoxShape.circle),
          child: Image.asset(
            'assets/images/Component 2 – 2.png',
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
                color: Colors.green, shape: BoxShape.circle),
          ),
        )
      ],
    );
  }
}

class SpecializationCard extends StatelessWidget {
  const SpecializationCard({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: appTheme.secondary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12.sp)),
      child: Text(
        title,
        style: appTheme.text12.copyWith(color: appTheme.secondary),
      ),
    );
  }
}
