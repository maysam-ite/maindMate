import 'main_bottom_navigation_controller.dart';
import 'package:get/get.dart';
// Import your controller

class MainBottomNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainBottomNavigationController>(
        () => MainBottomNavigationController());
  }
}
