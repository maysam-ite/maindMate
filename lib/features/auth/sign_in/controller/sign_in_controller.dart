import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/server/handling_status_code.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/shared/widgets/snackbar_manager.dart';

class SignInController extends GetxController {
  RxBool isRemmberMeActive = false.obs;
  RxBool isLoading = false.obs;
  late GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  onPressContinue() async {
    FormState? formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      isLoading.value = true;
      Either<ErrorResponse, Map<String, dynamic>> response;
      response = await ApiHelper.makeRequest(
          targetRout: ServerConstApis.signIn,
          method: "Post",
          data: {
            "email": emailOrPhoneController.text,
            "password": passwordController.text,
          });
      dynamic handlingResponse = response.fold((l) => l, (r) => r);
      print(handlingResponse);
      if (handlingResponse is ErrorResponse) {
        SnackbarManager.showSnackbar(
            getMessageFromStatus(handlingResponse.status!));
      } else {}
    }
  }
}
