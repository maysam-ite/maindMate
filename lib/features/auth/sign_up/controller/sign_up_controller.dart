import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/shared/widgets/snackbar_manager.dart';
import 'package:maindmate/main.dart';

class SignUpController extends GetxController {
  RxString gender = ''.obs;
  RxBool isRemmberMeActive = false.obs;
  RxBool isDoctor = false.obs;
  RxBool isAcceptTermOfUs = false.obs;
  RxBool isLoading = false.obs;
  late GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  onPressContinue() async {
    FormState? formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      isLoading.value = true;
      Either<ErrorResponse, Map<String, dynamic>> response;
      response = await ApiHelper.makeRequest(
          targetRout: ServerConstApis.register,
          method: "Post",
          data: {
            'name': nameController.text,
            'email': emailController.text,
            'password': passwordController.text,
            'password_confirmation': confirmPasswordController.text,
            'phone': phoneController.text,
            'usertype': isDoctor.value ? 'doctor' : 'user',
          });
      dynamic handlingResponse = response.fold((l) => l, (r) => r);
      print("ddddddddddddd");
      print("ddddddddddddd");
      if (handlingResponse is ErrorResponse) {
      print(handlingResponse.validationErrors!.getAllMessages());
        // isLoading.value = false;
        SnackbarManager.showSnackbar(
            handlingResponse.validationErrors!.getAllMessages()[0], backgroundColor: appTheme.error);
      } else {}
    }
  }
}
