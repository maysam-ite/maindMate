import 'package:get/get.dart';
import 'package:maindmate/core/const/user_type.dart';
import 'package:maindmate/features/doctor/profile/controller/doctor_profile_controller.dart';
import 'package:maindmate/features/patient/profile/controller/patient_profile_controller.dart';
import 'package:maindmate/features/stories/add_story/controller/add_story_controller.dart';
import 'package:maindmate/features/stories/stories/controller/stories_controller.dart';
import 'package:maindmate/core/services/user_session_service.dart';
import 'main_bottom_navigation_controller.dart';

class MainBottomNavigationBinding implements Bindings {
  @override
  void dependencies() {
    final UserSessionService userSessionService =
        Get.find<UserSessionService>();

    Get.lazyPut<MainBottomNavigationController>(
        () => MainBottomNavigationController());
    Get.lazyPut<StoriesController>(() => StoriesController());
    Get.lazyPut<AddStoryController>(() => AddStoryController());

    // Conditionally initialize profile controllers based on user type
    if (userSessionService.userType.value == UserType.patient) {
      Get.put<PatientProfileController>(PatientProfileController());
    } else if (userSessionService.userType.value == UserType.doctor) {
      Get.put<DoctorProfileController>(DoctorProfileController());
    }
  }
}
