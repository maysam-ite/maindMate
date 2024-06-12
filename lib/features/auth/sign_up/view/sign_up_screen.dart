import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/functions/validation/name_validation.dart';
import 'package:maindmate/core/shared/functions/validation/password_validation.dart';
import 'package:maindmate/core/shared/functions/validation/phone_validation.dart';
import 'package:maindmate/core/shared/text_fileds/custom_text_filed.dart';
import 'package:maindmate/core/shared/text_fileds/international_field.dart';
import 'package:maindmate/features/auth/sign_up/controller/sign_up_controller.dart';
import 'package:maindmate/features/auth/sign_up/view/widgets/select_gender.dart';
import 'package:maindmate/main.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: signUpController.formstate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Center(
                  child: Image.asset('assets/images/logo.png',
                      width: 200.w, height: 100.h)),
              Center(
                child: Text(
                  'create_account',
                  style: appTheme.text18.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 30.sp,
                      color: appTheme.primary),
                ).tr(),
              ),
              Text(
                tr('user_name'),
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ),
              customTextField(
                  label: tr('enter_user_name'),
                  controller: signUpController.nameController,
                  validator: (val) {
                    return nameValidation(val);
                  }),
              Text(
                'enter_email',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                  label: tr('email'),
                  controller: signUpController.emailController,
                  validator: (val) {
                    // return phoneValidation(val);
                  }),
              Text(
                'enter_phone',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              internationalField(signUpController.phoneController),
              Text(
                'enter_password',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                  label: tr('password'),
                  controller: signUpController.passwordController,
                  validator: (val) {
                    return passwordValidation(val);
                  }),
              Text(
                'اعد ادخال كلمة المرور',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ),
              customTextField(
                  label: tr('re_enter_password'),
                  controller: signUpController.confirmPasswordController,
                  validator: (val) {
                    return signUpController.confirmPasswordController.text ==
                            signUpController.passwordController.text
                        ? null
                        : tr(
                            "The confirm password doesn't mathcing the new password");
                  }),
              ContinueAsDoctor(),
              RemmeberMe(),
              TermOfUs(),
              SignUpButton(),
              const SignUpUsingFacebookGoogle(),
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
                      Get.offAndToNamed('/SignInScreen');
                    },
                    child: Text(
                      'login',
                      style: appTheme.text18.copyWith(
                          fontWeight: FontWeight.w500, color: appTheme.primary),
                    ).tr(),
                  )
                ],
              ),
            ].divide(const SizedBox(height: 5)),
          ),
        ),
      ),
    );
  }
}

class RemmeberMe extends StatelessWidget {
  RemmeberMe({super.key});
  final SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'remember_me',
          style: appTheme.text14.copyWith(fontWeight: FontWeight.normal),
        ).tr(),
        Obx(
          () => Switch(
              value: signUpController.isRemmberMeActive.value,
              onChanged: (value) {
                signUpController.isRemmberMeActive.value = value;
              }),
        )
      ],
    );
  }
}

class ContinueAsDoctor extends StatelessWidget {
  ContinueAsDoctor({super.key});
  final SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'continue_as_doctor',
          style: appTheme.text14.copyWith(fontWeight: FontWeight.normal),
        ).tr(),
        Obx(
          () => Switch(
              value: signUpController.isRemmberMeActive.value,
              onChanged: (value) {
                signUpController.isRemmberMeActive.value = value;
              }),
        )
      ],
    );
  }
}

class TermOfUs extends StatelessWidget {
  TermOfUs({super.key});
  final SignUpController signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Radio(
              value: false,
              groupValue: signUpController.isAcceptTermOfUs.value,
              onChanged: (val) {
                signUpController.isAcceptTermOfUs.value = val!;
              }),
        ),
        Text(
          'agree_terms',
          style: appTheme.text14.copyWith(fontWeight: FontWeight.normal),
        ).tr(),
        Text(
          'privacy_policy',
          style: appTheme.text14.copyWith(
              fontWeight: FontWeight.normal, color: appTheme.secondary),
        ).tr(),
      ],
    );
  }
}

class SignUpButton extends StatelessWidget {
  SignUpButton({super.key});
  final SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonWidget(
        showLoadingIndicator: signUpController.isLoading.value,
        onPressed: () {
          signUpController.onPressContinue();
        },
        text: tr('create_account'),
        options: ButtonOptions(
          width: MediaQuery.sizeOf(context).width * 0.6,
          height: 50,
          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
          iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          color: appTheme.primary,
          textStyle: appTheme.text18.copyWith(color: Colors.white),
          elevation: 3,
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
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
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/facebook.png'),
            const SizedBox(
              width: 15,
            ),
            Image.asset('assets/images/google.png'),
          ],
        )
      ],
    );
  }
}
