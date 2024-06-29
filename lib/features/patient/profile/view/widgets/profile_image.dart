import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maindmate/core/shared/widgets/bottom_sheet/show_bottom_sheet_for_images.dart';
import 'package:maindmate/features/patient/profile/controller/patient_profile_controller.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final PatientProfileController patientProfileController = Get.find();
        showBottomSheetForImages(
            context: context,
            onPressCamera: () {
              patientProfileController.pickImage(ImageSource.camera);
            },
            onPressGallery: () async {
              patientProfileController.pickImage(ImageSource.gallery);
            });
      },
      child: Center(
        child: GetBuilder<PatientProfileController>(builder: (controller) {
          ImageProvider imageProvider;

          if (controller.profilePictuer != null) {
            imageProvider = FileImage(controller.profilePictuer!);
          } else if (controller.patient.profile.imageUrl != null &&
              controller.patient.profile.imageUrl!.isNotEmpty) {
            imageProvider = NetworkImage(controller.patient.profile.imageUrl!);
          } else {
            imageProvider = AssetImage('assets/images/faceBookProfile.jfif');
          }

          return Container(
            width: 120.w,
            height: 120.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 5),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 30.w, // Width of the icon container
                height: 30
                    .w, // Height of the icon container, ensures a square shape
                decoration: BoxDecoration(
                  color: Colors.grey
                      .withOpacity(0.4), // Background color with opacity
                  shape: BoxShape.circle, // Circle shape
                  boxShadow: [
                    // Shadow for the icon
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: const Color(0xFAFAFAFF),
                  size: 20.w, // Adjusted size for better visibility
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
