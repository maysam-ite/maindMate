import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/text_fileds/custom_text_filed.dart';
import 'package:maindmate/main.dart';

class NormalUserProfileScreen extends StatelessWidget {
  const NormalUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 120.w,
                  height: 120.w,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 5),
                      image: DecorationImage(
                          image: Image.asset(
                            'assets/images/Component.png',
                          ).image,
                          fit: BoxFit.contain)),
                  child: Container(
                      // width: 5.w,
                      // height: 25.h,
                      // color: Colors.grey.withOpacity(0.4),
                      child: Icon(
                    Icons.camera_alt_rounded,
                    color: Color(0xFAFAFAFF),
                    size: 10,
                  )),
                ),
              ),
              Center(
                child: Text(
                  'full_name',
                  style: appTheme.text26.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 30.sp,
                      color: appTheme.primary),
                ).tr(),
              ),
              Text(
                'social_status',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                  label: '',
                  controller: TextEditingController(),
                  validator: (val) {
                    // return passwordValidation(val);
                  }),
              Text(
                'age',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                  label: '',
                  controller: TextEditingController(),
                  validator: (val) {
                    // return passwordValidation(val);
                  }),
              Text(
                'pathogenic',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                  label: '',
                  controller: TextEditingController(),
                  validator: (val) {
                    // return passwordValidation(val);
                  }),
              Text(
                'pharmaceutical_precedents',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                  label: '',
                  controller: TextEditingController(),
                  validator: (val) {
                    // return passwordValidation(val);
                  }),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [SkipButton(), CountinueButton()],
                ),
              )
            ].divide(SizedBox(
              height: 5.h,
            )),
          ),
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  SkipButton({super.key});
  // final SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      // showLoadingIndicator: signUpController.isLoading.value,
      onPressed: () {
        // signUpController.onPressContinue();
      },
      text: tr('skip'),
      options: ButtonOptions(
        width: 107.w,
        height: 35.h,
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: appTheme.primary,
        textStyle: appTheme.text18.copyWith(color: Colors.white),
        elevation: 3,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}

class CountinueButton extends StatelessWidget {
  CountinueButton({super.key});
  // final SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      // showLoadingIndicator: signUpController.isLoading.value,
      onPressed: () {
        // signUpController.onPressContinue();
      },
      text: tr('continue'),
      options: ButtonOptions(
        width: 107.w,
        height: 35.h,
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: appTheme.secondary,
        textStyle: appTheme.text18.copyWith(color: Colors.white),
        elevation: 3,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  SaveButton({super.key});
  // final SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      // showLoadingIndicator: signUpController.isLoading.value,
      onPressed: () {
        // signUpController.onPressContinue();
      },
      text: tr('save'),
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
    );
  }
}
