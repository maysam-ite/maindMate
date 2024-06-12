import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          lazyLoadedScreens[index] = SizedBox();
          break;
        case 1:
          lazyLoadedScreens[index] = SizedBox();
          break;
        case 2:
          lazyLoadedScreens[index] = SizedBox();
          break;
        case 3:
          lazyLoadedScreens[index] = true ? const SizedBox() : SizedBox();
          break;
        case 4:
          lazyLoadedScreens[index] = true ? const SizedBox() : SizedBox();
          break;
      }
    }
    return lazyLoadedScreens[index]!;
  }

  changePage(int index) {
    selectedPage.value = index;
  }
}
