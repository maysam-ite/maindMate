import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/features/patient/profile/controller/patient_profile_controller.dart';
import 'package:maindmate/features/stories/add_story/controller/add_story_controller.dart';
import 'package:maindmate/features/stories/stories/controller/stories_controller.dart';

import 'main_bottom_navigation_controller.dart';
import 'package:get/get.dart';
// Import your controller

class MainBottomNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainBottomNavigationController>(
        () => MainBottomNavigationController());
    Get.lazyPut<StoriesController>(() => StoriesController());
    Get.lazyPut<AddStoryController>(() => AddStoryController());
    Get.lazyPut<PatientProfileController>(() => PatientProfileController());
    Get.lazyPut<DoctorProfileController>(() => DoctorProfileController());
  }
}
