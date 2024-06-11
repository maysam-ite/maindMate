import 'package:get/get.dart';
import 'package:maindmate/features/experience/experience_detailes/controller/experience_detailes_controller.dart';
// Import your controller

class ExperienceDetailesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExperienceDetailesController>(
        () => ExperienceDetailesController());
  }
}
