import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/shared/widgets/snackbar_manager.dart';
import 'package:maindmate/main.dart';
import 'package:maindmate/core/navigation/routes.dart'; // Import your routes

class VerifyEmailController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isVerified = false.obs;

  Future<void> resendVerificationEmail() async {
    isLoading.value = true;
    String? token = await storeService.readString("token");

    Either<ErrorResponse, Map<String, dynamic>> response =
        await ApiHelper.makeRequest(
      targetRout: ServerConstApis.resendVerificationEmail,
      method: "POST",
      token: token,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    isLoading.value = false;

    if (handlingResponse is ErrorResponse) {
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      SnackbarManager.showSnackbar("Verification email sent!",
          backgroundColor: appTheme.success);
    }
  }

  Future<void> checkIfVerified() async {
    isLoading.value = true;
    String? token = await storeService.readString("token");

    Either<ErrorResponse, Map<String, dynamic>> response =
        await ApiHelper.makeRequest(
      targetRout: ServerConstApis.isVerified,
      method: "GET",
      token: token,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    isLoading.value = false;

    if (handlingResponse is ErrorResponse) {
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      isVerified.value = handlingResponse['is_verified'] == true;
      if (isVerified.value) {
        Get.offAllNamed(
            '/MainBottomNavigationBarWidget'); // Navigate to the main screen
      } else {
        SnackbarManager.showSnackbar("Your email is not verified yet.",
            backgroundColor: appTheme.error);
      }
    }
  }
}
