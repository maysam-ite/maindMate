import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:list_country_picker/list_country_picker.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/features/patient/profile/controller/patient_profile_controller.dart';
import 'package:maindmate/main.dart';

class PickCountries extends StatelessWidget {
  PickCountries({super.key});
  final DoctorProfileController doctorProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListCountryPiker(
      dialogTitle: 'إختر الدوله',
      locale: Get.locale!,
      onCountryChanged: (value) {
        doctorProfileController.country = value.name;
        doctorProfileController.update();
      },
      child: Container(
        width: double.infinity,
        height: (50.h),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: appTheme.primaryBackground,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: appTheme.primary.withOpacity(0.3),
          ),
        ),
        alignment: const AlignmentDirectional(-1, 0.00),
        child: GetBuilder<DoctorProfileController>(builder: (context) {
          return Text(
            doctorProfileController.country ?? "",
            style: appTheme.text16,
          );
        }),
      ),
    );
  }
}
