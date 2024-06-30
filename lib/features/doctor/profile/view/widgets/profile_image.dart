import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maindmate/core/shared/widgets/bottom_sheet/show_bottom_sheet_for_images.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/features/patient/profile/controller/patient_profile_controller.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final DoctorProfileController doctorProfileController = Get.find();
        showBottomSheetForImages(
            context: context,
            onPressCamera: () {
              doctorProfileController.pickImage(ImageSource.camera);
            },
            onPressGallery: () async {
              doctorProfileController.pickImage(ImageSource.gallery);
            });
      },
      child: Center(
        child: GetBuilder<DoctorProfileController>(builder: (controller) {
          return Container(
            width: 120.w,
            height: 120.w,
            // padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 5),
              image: DecorationImage(
                image: controller.profilePicture == null
                    ? AssetImage('assets/images/faceBookProfile.jfif')
                        as ImageProvider
                    : FileImage(controller.profilePicture
                        as File), // Cast to File if not already typed
                fit: BoxFit.contain,
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
