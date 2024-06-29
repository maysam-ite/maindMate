import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/shared/widgets/bottom_sheet/show_bottom_sheet.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/add_new_specialties.dart';
import 'package:maindmate/main.dart';

class SpecialtiesSection extends StatelessWidget {
  SpecialtiesSection({super.key});
  final DoctorProfileController doctorProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'specialties',
              style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
            ).tr(),
            IconButton(
                onPressed: () {
                  showButtonSheet(
                      context: context,
                      widget: addNewSpecialtie(),
                      height: 500);
                },
                icon: const Icon(Icons.add_circle_outlined))
          ],
        ),
        Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              runSpacing: 10,
              spacing: 20,
              runAlignment: WrapAlignment.start,
              children: [
                ...List.generate(
                    doctorProfileController.specialtiesList.length,
                    (index) => SpecializationCardWithDeleteAction(
                          title: doctorProfileController.specialtiesList[index],
                          index: index,
                        ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SpecializationCardWithDeleteAction extends StatelessWidget {
  const SpecializationCardWithDeleteAction(
      {super.key, required this.title, required this.index});
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: appTheme.secondary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.sp)),
          child: Text(
            title,
            style: appTheme.text14.copyWith(color: appTheme.secondary),
          ),
        ),
        Positioned(
            top: -1,
            left: -1,
            child: GestureDetector(
              onTap: () {
                Get.find<DoctorProfileController>().removeSpecialtie(index);
              },
              child: const Icon(
                Icons.cancel_rounded,
                size: 20,
              ),
            ))
      ],
    );
  }
}
