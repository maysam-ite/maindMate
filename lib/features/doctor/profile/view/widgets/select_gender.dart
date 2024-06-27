import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/main.dart';

class SelectGender extends StatelessWidget {
  SelectGender({super.key});
  final DoctorProfileController doctorProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectGenderItem(
            imagePath: 'assets/images/man.png',
            title: tr('male'),
            isSelected: doctorProfileController.gender.value == 'male',
            onTap: () {
              doctorProfileController.gender.value = 'male';
            },
          ),
          SelectGenderItem(
            imagePath: 'assets/images/woman.png',
            title: tr('female'),
            isSelected: doctorProfileController.gender.value == 'female',
            onTap: () {
              doctorProfileController.gender.value = 'female';
            },
          ),
          SelectGenderItem(
            imagePath: '',
            title: tr('prefer_not_to_say'),
            isSelected:
                doctorProfileController.gender.value == 'prefer not to say',
            onTap: () {
              doctorProfileController.gender.value = 'prefer not to say';
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
