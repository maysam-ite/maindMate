import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/widgets/general_app_bar.dart';
import 'package:maindmate/core/shared/widgets/rating/rating_row_widget.dart';
import 'package:maindmate/features/Consultations/book_now/view/widgets/select_time.dart';
import 'package:maindmate/main.dart';

class BookNowScreen extends StatelessWidget {
  const BookNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(),
      backgroundColor: appTheme.primaryBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            DoctorDetailes(),
            // SizedBox(height: 20),
            ChoiceSessionTime(),

            BookingPage(),
            SizedBox(height: 100),
            BookNowButton()
          ].divide(SizedBox(
            height: 20,
          )),
        ),
      ),
    );
  }
}

class BookNowButton extends StatelessWidget {
  BookNowButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonWidget(
        // showLoadingIndicator: signUpController.isLoading.value,
        onPressed: () {
          // signUpController.onPressContinue();
        },
        text: tr('book_now'),
        options: ButtonOptions(
          width: double.infinity,
          // height: 50,
          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
          iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          color: appTheme.primary,
          textStyle: appTheme.text14.copyWith(color: Colors.white),
          elevation: 3,
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}

class ChoiceSessionTime extends StatelessWidget {
  const ChoiceSessionTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'اختر مدة الجلسة ',
          style: appTheme.text14
              .copyWith(fontWeight: FontWeight.normal, fontSize: 10),
        ),
        Expanded(
          flex: 2,
          child: RadioListTile(
            value: '30',
            groupValue: '30',
            contentPadding: EdgeInsets.all(0),
            onChanged: (value) {},
            title: Text(
              'دقيقة 60/ 30 \$',
              style: appTheme.text10.copyWith(fontWeight: FontWeight.normal),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: RadioListTile(
            value: '60',
            contentPadding: EdgeInsets.all(0),
            groupValue: '30',
            onChanged: (value) {},
            title: Text(
              'دقيقة 60/ 30 \$',
              style: appTheme.text10.copyWith(fontWeight: FontWeight.normal),
            ),
          ),
        )
      ],
    );
  }
}

class DoctorDetailes extends StatelessWidget {
  const DoctorDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
          color: appTheme.primaryBackground,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserPhoto(),
          Column(
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
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StarRating(
                rating: 3.5,
                maxRating: 5,
              ),
              Text(
                '200 تقييم/ 4.5',
                style: appTheme.text12.copyWith(),
              ),
            ],
          )
        ],
      ),
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
