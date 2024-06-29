import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/features/patient/profile/controller/patient_profile_controller.dart';
import 'package:maindmate/main.dart';

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
  final PatientProfileController patientProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      showLoadingIndicator: patientProfileController.isLoading.value,
      onPressed: () {
        patientProfileController.onPressSave();
      },
      text: tr('save'),
      options: ButtonOptions(
        width: MediaQuery.sizeOf(context).width * 0.7,
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
