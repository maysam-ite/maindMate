import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/widgets/general_app_bar.dart';
import 'package:maindmate/main.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  const ConfirmPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.secondaryBackground,
        appBar: generalAppBar(),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Component 37 – 2.png'),
                  Padding(
                    padding: EdgeInsets.only(left: 60.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'James Vane',
                            style: appTheme.text14,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text('123456 789 55', style: appTheme.text14),
                          Text('12/25 CSV/CVV ***', style: appTheme.text14),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  ButtonWidget(
                    // showLoadingIndicator: signInController.isLoading.value,
                    onPressed: () {
                      // Get.toNamed('/ConfirmPaymentScreen');
                    },
                    text: ('300 \$'),
                    options: ButtonOptions(
                      width: 226.w,
                      height: 70.h,
                      padding: EdgeInsetsDirectional.fromSTEB(24.w, 0, 24.w, 0),
                      iconPadding: EdgeInsetsDirectional.zero,
                      color: appTheme.secondary,
                      textStyle: appTheme.text18.copyWith(color: Colors.white),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  ButtonWidget(
                    // showLoadingIndicator: signInController.isLoading.value,
                    onPressed: () {
                      // Get.toNamed('/ConfirmPaymentScreen');
                    },
                    text: ('اكمال الدفع'),
                    options: ButtonOptions(
                      width: 0.6.sw,
                      height: 50.h,
                      padding: EdgeInsetsDirectional.fromSTEB(24.w, 0, 24.w, 0),
                      iconPadding: EdgeInsetsDirectional.zero,
                      color: appTheme.primary,
                      textStyle: appTheme.text18.copyWith(color: Colors.white),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                  ),
                ],
              ),
            )));
  }
}
