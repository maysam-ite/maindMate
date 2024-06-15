import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maindmate/features/Consultations/book_a_consultation/view/book_a_consultation_screen.dart';
import 'package:maindmate/features/experience/experience_of_others/view/experience_of_others_screen.dart';
import 'package:maindmate/features/group_therapy/select_group_therapy/view/select_group_therapy_screen.dart';

class MainBottomNavigationController extends GetxController {
  @override
  void onInit() async {
    // await startTracking();

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
          lazyLoadedScreens[index] = const ExperienceOfOthersScreen();
          break;
        case 1:
          lazyLoadedScreens[index] = const BookAConsultationScreen();
          break;
        case 2:
          lazyLoadedScreens[index] = const SizedBox();
          break;
        case 3:
          lazyLoadedScreens[index] =
              true ? const SelectGroupTherapyScreen() : const SizedBox();
          break;
        case 4:
          lazyLoadedScreens[index] = true ? const SizedBox() : const SizedBox();
          break;
      }
    }
    return lazyLoadedScreens[index]!;
  }

  changePage(int index) {
    selectedPage.value = index;
  }
}
