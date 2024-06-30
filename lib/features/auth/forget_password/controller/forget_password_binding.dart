import 'package:get/get.dart';
import 'package:maindmate/features/auth/forget_password/controller/forget_password_controller.dart';
// Import your controller

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController());
  }
}
