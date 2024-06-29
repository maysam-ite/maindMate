import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/services/user_session_service.dart';
import 'package:maindmate/main.dart';

class LogOutController extends GetxController {
  Future<void> logOutUser() async {
    Either<ErrorResponse, Map<String, dynamic>> response;
    String token = await storeService.readString("token");
    response = await ApiHelper.makeRequest(
      targetRout: ServerConstApis.logout,
      method: "Post",
      token: token,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      // Handle error appropriately
    } else {
      await storeService.remove('token');
      UserSessionService userSessionService = Get.find<UserSessionService>();
      userSessionService.resetUserSession();
      Get.offAllNamed('/');
    }
  }
}
