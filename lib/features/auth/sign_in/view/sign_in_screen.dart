import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < 600 ? _buildMobileLayout() : _buildTabletLayout();
        },
      ),
    );
  }

  Widget _buildMobileLayout() {
    return _buildFormLayout(150.w, 32.sp);
  }

  Widget _buildTabletLayout() {
    return Center(child: _buildFormLayout(200.w, 40.sp, maxWidth: 600.w));
  }

  Widget _buildFormLayout(double imageSize, double titleSize, {double? maxWidth}) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Form(
        key: signInController.formstate,
        child: Container(
          width: maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70.h),
              Center(child: Image.asset('assets/images/logo.png', width: imageSize, height: imageSize)),
              SizedBox(height: 50.h),
              Center(child: TitleText(text: 'login', fontSize: titleSize, color: appTheme.primary)),
              SizedBox(height: 20.h),
              CustomTextField(
                label: 'enter_email_or_phone',
                controller: signInController.emailOrPhoneController,
                validator: phoneValidation,
              ),
              CustomTextField(
                label: 'enter_password',
                controller: signInController.passwordController,
                validator: passwordValidation,
              ),
              RemmeberMe(),
              SizedBox(height: 30.h),
              SignInButton(),
              SizedBox(height: 20.h),
              SignUpUsingFacebookGoogle(),
              SizedBox(height: 30.h),
              _buildFooter(),
            ].divide(SizedBox(height: 5.h)),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleText(text: 'i_have_an_account', fontSize: 16, color: Colors.black),
        GestureDetector(
          onTap: () {},
          child: TitleText(text: 'login', fontSize: 18, color: appTheme.primary),
        ),
      ],
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
        TitleText(text: 'remember_me', fontSize: 18, color: Colors.black),
        Obx(() => Switch(
          value: signUpController.isRemmberMeActive.value,
          onChanged: (value) {
            signUpController.isRemmberMeActive.value = value;
          },
        )),
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
        TitleText(text: 'or_register_with', fontSize: 14, color: Colors.black),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/facebook.png', width: 40.w, height: 40.h),
            SizedBox(width: 15.w),
            Image.asset('assets/images/google.png', width: 40.w, height: 40.h),
          ],
        ),
      ],
    );
  }
}
class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const TitleText({required this.text, required this.fontSize, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: appTheme.text18.withSize(fontSize).withColor(color).withWeight(FontWeight.normal),
    ).tr();
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  const CustomTextField({required this.label, required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(text: label, fontSize: 18, color: Colors.black),
        customTextField(
          label: tr(label),
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }
}

class SignInButton extends StatelessWidget {
  final SignInController signInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonWidget(
        showLoadingIndicator: signInController.isLoading.value,
        onPressed: signInController.onPressContinue,
        text: tr('login'),
        options: ButtonOptions(
          width: 0.6.sw,
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          color: appTheme.primary,
          textStyle: appTheme.text18.withColor(Colors.white),
          elevation: 3,
          borderSide: BorderSide(color: Colors.transparent, width: 1.w),
          borderRadius: BorderRadius.circular(40.r),
        ),
      ),
    );
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle withSize(double size) => copyWith(fontSize: size.sp);
}

