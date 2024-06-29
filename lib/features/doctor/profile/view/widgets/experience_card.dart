import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/shared/functions/helper/date_formatter.dart';
import 'package:maindmate/core/shared/widgets/bottom_sheet/show_bottom_sheet.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/features/doctor/profile/model/doctor_profile_model.dart';
import 'package:maindmate/features/doctor/profile/view/widgets/update_and_delete_exist_experience.dart';
import 'package:maindmate/main.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;
  final int experienceIndex;

  ExperienceCard({
    required this.experience,
    required this.experienceIndex,
  });
  final DoctorProfileController doctorProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showButtonSheet(
            context: context,
            widget: UpdateAndDeleteExistExperience(
              experience: doctorProfileController
                  .generalExperienceList[experienceIndex],
              experienceType: 'experience',
              onUpdate: (String title, String experienceFrom,
                  DateTime? startDate, DateTime? endDate) {
                doctorProfileController.updateExistExperience('experience',
                    title, experienceFrom, startDate, endDate, experienceIndex);
                Get.back();
              },
              onDelete: () {
                doctorProfileController.removeExistexperience(experienceIndex);
              },
            ),
            height: 600.h);
      },
      child: Card(
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(experience.title,
                  style: appTheme.text18.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 8),
              Text(
                experience.from,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'From: ${DateFormatter.formatDate(experience.startDate)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'To: ${DateFormatter.formatDate(experience.endDate)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
