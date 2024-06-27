import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/shared/widgets/videos/cards_local_video_widget%20.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/main.dart';

class PickVideo extends StatelessWidget {
  PickVideo({super.key});
  final DoctorProfileController doctorProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        doctorProfileController.pickVideo();
      },
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          color: appTheme.primaryBackground,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: appTheme.primary.withOpacity(0.3),
          ),
        ),
        child: GetBuilder<DoctorProfileController>(builder: (context) {
          return doctorProfileController.profileVideo == null
              ? Center(
                  child: Icon(
                    Icons.file_upload_outlined,
                    size: 50.w,
                  ),
                )
              : Stack(
                  children: [
                    CardsLocalVideoWidget(
                      currentVideoUrl: doctorProfileController.profileVideo!,
                      videoHgiht: 200.h,
                      videoWidth: double.infinity,
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: GestureDetector(
                            onTap: () {
                              doctorProfileController.removeSelectedVideo();
                            },
                            child: const Icon(Icons.cancel_rounded,
                                color: Colors.red)))
                  ],
                );
        }),
      ),
    );
  }
}
