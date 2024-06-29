import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/shared/widgets/bottom_sheet/show_bottom_sheet.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/add_new_experience.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/experience_card.dart';
import 'package:maindmate/main.dart';

class CertificatesSection extends StatelessWidget {
  CertificatesSection({super.key});
  final DoctorProfileController doctorProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'certificate',
            style: appTheme.text16.copyWith(fontWeight: FontWeight.normal),
          ).tr(),
          IconButton(
              onPressed: () {
                showButtonSheet(
                    context: context,
                    widget: AddNewExperience(
                      experienceType: 'certificate',
                      onCreate: (String title, String experienceFrom,
                          DateTime? startDate, DateTime? endDate) {
                        doctorProfileController.addNewExperience('certificate',
                            title, experienceFrom, startDate, endDate);
                        Get.back();
                      },
                    ),
                    height: 600.h);
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
              ...doctorProfileController.generalExperienceList
                  .asMap()
                  .entries
                  .where((entry) => entry.value.edExCe == 'certificate')
                  .map((entry) {
                final index = entry.key;
                final experience = entry.value;
                return ExperienceCard(
                  experience: experience,
                  experienceIndex: index,
                );
              }).toList(),
            ],
          ),
        ),
      ),
    ]);
  }
}
