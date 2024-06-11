import 'package:get/get.dart';
import 'package:maindmate/features/experience/experience_of_others/controller/experience_of_others_controller.dart';
// Import your controller

class ExperienceOfOThersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExperienceOfOThersController>(
        () => ExperienceOfOThersController());
  }
}
