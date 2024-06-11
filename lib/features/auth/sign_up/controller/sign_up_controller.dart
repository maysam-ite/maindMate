import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxString gender = ''.obs;
  RxBool isRemmberMeActive = false.obs;
  RxBool isAcceptTermOfUs = false.obs;
  RxBool isLoading = false.obs;
  late GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  onPressContinue() {
        FormState? formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
    }
    Get.toNamed('/ExperienceOfOthersScreen');
  }
}
