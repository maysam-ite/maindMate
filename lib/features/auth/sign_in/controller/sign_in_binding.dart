import 'package:get/get.dart';
import 'package:maindmate/features/auth/sign_in/controller/sign_in_controller.dart';
// Import your controller

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
   }
}
