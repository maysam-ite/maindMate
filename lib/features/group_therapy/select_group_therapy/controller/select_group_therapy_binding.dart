import 'package:get/get.dart';
import 'package:maindmate/features/group_therapy/select_group_therapy/controller/select_group_therapy_controller.dart';
// Import your controller

class SelectGroupTherapyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectGroupTherapyController>(
        () => SelectGroupTherapyController());
  }
}
