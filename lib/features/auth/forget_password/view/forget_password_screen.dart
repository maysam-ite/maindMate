import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/functions/validation/email_validation.dart';
import 'package:maindmate/core/shared/text_fileds/custom_text_filed.dart';
import 'package:maindmate/features/auth/forget_password/controller/forget_password_controller.dart';
import 'package:maindmate/main.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final ForgetPasswordController forgetPasswordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Form(
          key: forgetPasswordController.formstate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Center(
                  child: Image.asset('assets/images/logo.png',
                      width: 200.w, height: 100.h)),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forget Password',
                    style: appTheme.text18.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 32.sp,
                        color: appTheme.primary),
                  ).tr(),
                ],
              ),
              SizedBox(height: 50.h),
              Text(
                'enter_email',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                label: tr('email'),
                controller: forgetPasswordController.emailController,
                validator: (val) {
                  return emailValidation(val);
                },
              ),
              SizedBox(height: 80.h),
              ContinueButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  ContinueButton({super.key});
  final ForgetPasswordController forgetPasswordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => ButtonWidget(
          showLoadingIndicator: forgetPasswordController.isLoading.value,
          onPressed: () {
            forgetPasswordController.onPressContinue();
          },
          text: tr('Continue'),
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
      ),
    );
  }
}
