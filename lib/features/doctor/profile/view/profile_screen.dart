import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/functions/validation/name_validation.dart';
import 'package:maindmate/core/shared/text_fileds/custom_text_filed.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/certificates_section.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/date_of_birth.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/doctor_profile_buttons.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/education_section.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/experience_section.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/pick_countries.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/pick_language.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/pick_video_for_doctor.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/profile_image.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/select_gender.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/specialties_section.dart';
import 'package:maindmate/main.dart';

class DoctorProfileScreen extends StatelessWidget {
  DoctorProfileScreen({super.key});
  final DoctorProfileController doctorProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Obx(
          () => doctorProfileController.isLoadingPage.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileImage(),
                      Text(
                        'full_name',
                        style: appTheme.text16
                            .copyWith(fontWeight: FontWeight.normal),
                      ).tr(),
                      customTextField(
                          label: '',
                          controller: doctorProfileController.fullName,
                          validator: (val) {
                            return nameValidation(val);
                          }),
                      Text(
                        'nick_name',
                        style: appTheme.text16
                            .copyWith(fontWeight: FontWeight.normal),
                      ).tr(),
                      customTextField(
                          label: '',
                          controller: doctorProfileController.nickName,
                          validator: (val) {
                            return nameValidation(val);
                          }),
                      Text(
                        'age',
                        style: appTheme.text16
                            .copyWith(fontWeight: FontWeight.normal),
                      ).tr(),
                      SetDateOfBirth(),
                      Text(
                        'country',
                        style: appTheme.text16
                            .copyWith(fontWeight: FontWeight.normal),
                      ).tr(),
                      PickCountries(),
                      Text(
                        'language',
                        style: appTheme.text16
                            .copyWith(fontWeight: FontWeight.normal),
                      ).tr(),
                      PickLanguage(),
                      Text(
                        'gender',
                        style: appTheme.text16
                            .copyWith(fontWeight: FontWeight.normal),
                      ).tr(),
                      SelectGender(),
                      Text(
                        'video',
                        style: appTheme.text16
                            .copyWith(fontWeight: FontWeight.normal),
                      ).tr(),
                      PickVideo(),
                      SpecialtiesSection(),
                      ExperienceSection(),
                      CertificatesSection(),
                      EducationSection(),
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
      ),
    );
  }
}
