import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/features/patient/profile/controller/patient_profile_controller.dart';
import 'package:maindmate/main.dart';

class SelectGender extends StatelessWidget {
  SelectGender({super.key});
  final PatientProfileController patientProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectGenderItem(
            imagePath: 'assets/images/man.png',
            title: tr('male'),
            isSelected: patientProfileController.gender.value == 'male',
            onTap: () {
              patientProfileController.gender.value = 'male';
            },
          ),
          SelectGenderItem(
            imagePath: 'assets/images/woman.png',
            title: tr('female'),
            isSelected: patientProfileController.gender.value == 'female',
            onTap: () {
              patientProfileController.gender.value = 'female';
            },
          ),
          SelectGenderItem(
            imagePath: '',
            title: tr('prefer_not_to_say'),
            isSelected: patientProfileController.gender.value == 'prefer not to say',
            onTap: () {
              patientProfileController.gender.value = 'prefer not to say';
            },
          ),
        ],
      ),
    );
  }
}

class SelectGenderItem extends StatelessWidget {
  const SelectGenderItem(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.isSelected,
      required this.onTap});
  final String imagePath;
  final String title;
  final void Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
                color:
                    isSelected ? appTheme.primary : appTheme.primaryBackground,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: appTheme.accent1, width: 1)),
            padding: const EdgeInsets.all(10),
            child: imagePath == ''
                ? const SizedBox()
                : Image.asset(imagePath,
                    color: isSelected
                        ? appTheme.primaryBackground
                        : appTheme.secondary),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(title,
            style: appTheme.text16.copyWith(fontWeight: FontWeight.normal)),
      ],
    );
  }
}
