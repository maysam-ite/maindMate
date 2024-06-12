import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/features/auth/sign_up/controller/sign_up_controller.dart';
import 'package:maindmate/main.dart';

class SelectGender extends StatelessWidget {
  SelectGender({super.key});
  final SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectGenderItem(
            imagePath: 'assets/images/man.png',
            title: tr('male'),
            isSelected: signUpController.gender.value == 'man',
            onTap: () {
              signUpController.gender.value = 'man';
            },
          ),
          SelectGenderItem(
            imagePath: 'assets/images/woman.png',
            title: tr('female'),
            isSelected: signUpController.gender.value == 'woman',
            onTap: () {
              signUpController.gender.value = 'woman';
            },
          ),
          SelectGenderItem(
            imagePath: '',
            title: tr('prefer_not_to_say'),
            isSelected: signUpController.gender.value == 'non',
            onTap: () {
              signUpController.gender.value = 'non';
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
