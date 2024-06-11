import 'package:get/get.dart';
import 'package:maindmate/features/auth/sign_up/controller/sign_up_controller.dart';
// Import your controller

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
   }
}
