import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/features/Consultations/book_a_consultation/view/widgets/book_a_consiltation_widget_header.dart';
import 'package:maindmate/main.dart';

class MyAppointmentsSection extends StatelessWidget {
  const MyAppointmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مواعيدي',
            style: appTheme.text12,
          ),
          ...List.generate(3, (index) => const MyAppointmentsCard())
        ].divide(const SizedBox(
          height: 10,
        )));
  }
}

class MyAppointmentsCard extends StatelessWidget {
  const MyAppointmentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      width: 384.w,
      height: 140.h,
      decoration: BoxDecoration(
          color: appTheme.secondary, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          const SessionGeneralInformation(),
          Row(
            children: [
              Image.asset(
                'assets/images/stopwatch.png',
                color: appTheme.primaryBtnText,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'تبدأ',
                style: appTheme.text12,
              ),
              const SizedBox(
                width: 5,
              ),
              Text('05:00 PM', style: appTheme.text12),
              const SizedBox(
                width: 15,
              ),
              Image.asset('assets/images/whatsapp.png'),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/images/telegram.png',
                color: appTheme.lineColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset('assets/images/googlemeet.png'),
              const SizedBox(
                width: 5,
              ),
              Image.asset('assets/images/zoom.png'),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'عبد الله خالد',
                    style: appTheme.text16
                        .copyWith(color: appTheme.primaryBtnText),
                  ),
                  // const SizedBox(height: 10),
                  Text(
                    'طيب نفسي',
                    style: appTheme.text12
                        .copyWith(color: appTheme.primaryBtnText),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class SessionGeneralInformation extends StatelessWidget {
  const SessionGeneralInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              'عنوان الجلسة العام',
              style: appTheme.text18.copyWith(color: appTheme.primaryBtnText),
            ),
            Row(
              children: List.generate(3, (index) => const ClassificationCard())
                  .divide(const SizedBox(
                width: 3,
              )),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset('assets/images/Group 204.png'),
            ),
            const SizedBox(height: 5),
            Text('05', style: appTheme.text12),
          ],
        ),
        const UserPhoto(),
      ],
    );
  }
}

class ClassificationCard extends StatelessWidget {
  const ClassificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: appTheme.primaryBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        'القلdddق',
        style: appTheme.text10.copyWith(color: appTheme.secondary),
      ),
    );
  }
}
