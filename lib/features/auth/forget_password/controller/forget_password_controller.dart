import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/shared/widgets/dialog/general_messages_dialog.dart';
import 'package:maindmate/core/shared/widgets/snackbar_manager.dart';
import 'package:maindmate/main.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  Future<void> onPressContinue() async {
    if (!formstate.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    Either<ErrorResponse, Map<String, dynamic>> response =
        await ApiHelper.makeRequest(
      targetRout: ServerConstApis
          .forgotPassword, // Update with your actual API endpoint
      method: "POST",
      data: {
        "email": emailController.text,
      },
    );

    isLoading.value = false;

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      showGeneralAppDialog(
        title: "Success",
        message: "Please check your email for password reset instructions.",
        confirmText: "OK",
      );
    }
  }
}
