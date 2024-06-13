import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/features/Consultations/book_a_consultation/view/widgets/book_a_consiltation_widget_header.dart';
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
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const WidgetHeader(),
          Divider(
            color: appTheme.primaryText,
          ),
          const SessionDetailes()
        ],
      ),
    );
  }
}

class SessionDetailes extends StatelessWidget {
  const SessionDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
            children:
                [const TimeDetailes(), const PriceDetailes()].divide(SizedBox(
          height: 5.h,
        ))),
        const Spacer(),
        BookNowButton()
      ],
    );
  }
}

class TimeDetailes extends StatelessWidget {
  const TimeDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/stopwatch.png'),
        Text(
          'متاح',
          style: appTheme.text12,
        ),
        Text(
          'اليوم ,',
          style: appTheme.text10,
        ),
        Text(
          '25 ايلول',
          style: appTheme.text10,
        ),
        Text(
          'الساعة 5:30 م',
          style: appTheme.text10,
        ),
      ].divide(SizedBox(
        width: 5.w,
      )),
    );
  }
}

class PriceDetailes extends StatelessWidget {
  const PriceDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/money.png'),
        Text(
          'دقيقة',
          style: appTheme.text10,
        ),
        Text(
          '30 / 25 \$',
          style: appTheme.text10,
        ),
        Text(
          'دقيقة',
          style: appTheme.text10,
        ),
        Text(
          '60 / 25 \$',
          style: appTheme.text10,
        ),
      ].divide(SizedBox(
        width: 5.w,
      )),
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
          Get.toNamed('/BookNowScreen');
        },
        text: tr('book_now'),
        options: ButtonOptions(
          // width: MediaQuery.sizeOf(context).width * 0.2,
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
