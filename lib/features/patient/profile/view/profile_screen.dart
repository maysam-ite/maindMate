import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/functions/validation/name_validation.dart';
import 'package:maindmate/core/shared/text_fileds/custom_text_filed.dart';
import 'package:maindmate/features/patient/profile/controller/patient_profile_controller.dart';
import 'package:maindmate/features/patient/profile/view/widgets/date_of_birth.dart';
import 'package:maindmate/features/patient/profile/view/widgets/patient_profile_buttons.dart';
import 'package:maindmate/features/patient/profile/view/widgets/pick_countries.dart';
import 'package:maindmate/features/patient/profile/view/widgets/pick_language.dart';
import 'package:maindmate/features/patient/profile/view/widgets/profile_image.dart';
import 'package:maindmate/features/patient/profile/view/widgets/select_gender.dart';
import 'package:maindmate/main.dart';

class PatientProfileScreen extends StatelessWidget {
  PatientProfileScreen({super.key});
  final PatientProfileController patientProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileImage(),
              Text(
                'full_name',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                  label: '',
                  controller: patientProfileController.socialStatus,
                  validator: (val) {
                    return nameValidation(val);
                  }),
              Text(
                'nick_name',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                  label: '',
                  controller: patientProfileController.nickName,
                  validator: (val) {
                    return nameValidation(val);
                  }),
              Text(
                'age',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              SetDateOfBirth(),
              Text(
                'drug_history',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                  label: '',
                  controller: patientProfileController.drugHistory,
                  validator: (val) {
                    return null;
                  }),
              Text(
                'medical_history',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              customTextField(
                  label: '',
                  controller: patientProfileController.medicalHistory,
                  validator: (val) {
                    return null;
                  }),
              Text(
                'country',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              PickCountries(),
              Text(
                'language',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              PickLanguage(),
              Text(
                'gender',
                style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
              ).tr(),
              SelectGender(),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: [SkipButton(), CountinueButton()],
                  children: [SaveButton()],
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
