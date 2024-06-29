import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/const/user_type.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/main.dart';

class UserSessionService extends GetxService {
  // Default to guest for simplicity
  Rx<UserType> userType = UserType.guest.obs;

  Future<UserSessionService> init() async {
    // Fetch user type from API or secure storage
    await getUserType();
    return this;
  }

  Future<void> getUserType() async {
    String? token = await storeService.readString("token");

    // If there's no token, set user type to guest
    if (token == '' || token.isEmpty) {
      userType.value = UserType.guest;
      return;
    }

    Either<ErrorResponse, Map<String, dynamic>> response;
    response = await ApiHelper.makeRequest(
      targetRout: ServerConstApis.user,
      method: "GET",
      token: token,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      // Handle error appropriately
      userType.value = UserType.guest; // Default to guest on error
    } else {
      String userTypeStr = handlingResponse['usertype'] ?? 'user';
      if (userTypeStr == 'doctor') {
        userType.value = UserType.doctor;
      } else if (userTypeStr == 'user') {
        userType.value = UserType.patient;
      } else {
        userType.value = UserType.guest;
      }
    }
  }

  void setUserType(UserType type) {
    userType.value = type;
  }

  void resetUserSession() {
    userType.value = UserType.guest;
  }
}
