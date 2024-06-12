import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/functions/validation/email_validation.dart';
import 'package:maindmate/core/shared/functions/validation/password_validation.dart';
import 'package:maindmate/core/shared/functions/validation/phone_validation.dart';
import 'package:maindmate/core/shared/text_fileds/custom_text_filed.dart';
import 'package:maindmate/features/auth/sign_in/controller/sign_in_controller.dart';
import 'package:maindmate/main.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final SignInController signInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Form(
          key: signInController.formstate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Center(
                  child: Image.asset('assets/images/logo.png',
                      width: 200.w, height: 100.h)),
              // SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'login',
                    style: appTheme.text18.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 32.sp,
                        color: appTheme.primary),
                  ).tr(),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'enter_email_or_phone',
                style: appTheme.text18.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                label: tr('email_or_phone'),
                controller: signInController.emailOrPhoneController,
                validator: (val) {
                  return emailValidation(val);
                },
              ),
              Text(
                'enter_password',
                style: appTheme.text18.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                label: tr('password'),
                controller: signInController.passwordController,
                validator: (val) {
                  return passwordValidation(val);
                },
              ),
              RemmeberMe(),
              SizedBox(height: 30.h),
              SignInButton(),
              SizedBox(height: 20.h),
              const SignUpUsingFacebookGoogle(),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'i_have_an_account',
                    style:
                        appTheme.text16.copyWith(fontWeight: FontWeight.normal),
                  ).tr(),
                  GestureDetector(
                    onTap: () {
                      Get.offAndToNamed('/SignUpScreen');
                    },
                    child: Text(
                      'create_account',
                      style: appTheme.text18.copyWith(
                          fontWeight: FontWeight.w500, color: appTheme.primary),
                    ).tr(),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 5.h)),
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  SignInButton({super.key});
  final SignInController signInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonWidget(
        showLoadingIndicator: signInController.isLoading.value,
        onPressed: () {
          signInController.onPressContinue();
        },
        text: tr('login'),
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
    );
  }
}

class RemmeberMe extends StatelessWidget {
  RemmeberMe({super.key});
  final SignInController signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'remember_me',
          style: appTheme.text18.copyWith(fontWeight: FontWeight.normal),
        ).tr(),
        Obx(
          () => Switch(
            value: signUpController.isRemmberMeActive.value,
            onChanged: (value) {
              signUpController.isRemmberMeActive.value = value;
            },
          ),
        ),
      ],
    );
  }
}

class SignUpUsingFacebookGoogle extends StatelessWidget {
  const SignUpUsingFacebookGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'or_register_with',
          style: appTheme.text14.copyWith(fontWeight: FontWeight.normal),
        ).tr(),
        SizedBox(height: 10.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/facebook.png',
                width: 40.w, height: 40.h),
            SizedBox(width: 15.w),
            Image.asset('assets/images/google.png', width: 40.w, height: 40.h),
          ],
        ),
      ],
    );
  }
}
