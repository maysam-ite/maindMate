import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/const/user_type.dart';
import 'package:maindmate/features/Consultations/book_a_consultation/view/book_a_consultation_screen.dart';
import 'package:maindmate/features/doctor/profile/view/profile_screen.dart';
import 'package:maindmate/features/patient/profile/view/profile_screen.dart';
import 'package:maindmate/features/stories/add_story/view/add_story_screen.dart';
import 'package:maindmate/features/stories/stories/view/stories_screen.dart';
import 'package:maindmate/features/group_therapy/select_group_therapy/view/select_group_therapy_screen.dart';
import 'package:maindmate/core/services/user_session_service.dart';

class MainBottomNavigationController extends GetxController {
  final UserSessionService userSessionService = Get.find<UserSessionService>();

  @override
  void onInit() async {
    super.onInit();
  }

  RxInt selectedPage = 0.obs;
  final List<Widget?> lazyLoadedScreens = [
    null,
    null,
    null,
    null,
    null,
  ]; // Assuming 5 tabs

  Widget getScreen(int index) {
    if (lazyLoadedScreens[index] == null) {
      // Initialize the screen if it hasn't been initialized yet
      switch (index) {
        case 0:
          lazyLoadedScreens[index] = StoriesScreen();
          break;
        case 1:
          lazyLoadedScreens[index] = const BookAConsultationScreen();
          break;
        case 2:
          lazyLoadedScreens[index] = AddStoryScreen();
          break;
        case 3:
          lazyLoadedScreens[index] = const SelectGroupTherapyScreen();
          break;
        case 4:
          // Decide which profile screen to show based on the user type
          lazyLoadedScreens[index] = userSessionService.userType.value ==
                  UserType.patient
              ? PatientProfileScreen()
              : userSessionService.userType.value == UserType.doctor
                  ? DoctorProfileScreen()
                  : const SizedBox(); // Handle guest or other types appropriately
          break;
      }
    }
    return lazyLoadedScreens[index]!;
  }

  void changePage(int index) {
    selectedPage.value = index;
    print(selectedPage.value);
  }
}
