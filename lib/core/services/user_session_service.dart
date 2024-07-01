import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/const/user_type.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/main.dart';

class UserSessionService extends GetxService {
  Rx<UserType> userType = UserType.guest.obs;
  RxBool isEmailVerified = false.obs;

  Future<UserSessionService> init() async {
    await getUserType(false);
    return this;
  }

  Future<void> getUserType(bool isSameSession) async {
    String? token = await storeService.readString("token");
    bool isRememberMeActive =
        await storeService.readString('isRemmberMeActive') == 'true';
    if (token == '' || token.isEmpty) {
      print("inside first ");
      userType.value = UserType.guest;
      targetRout = '/';
      return;
    } else if (token.isNotEmpty && isSameSession) {
      print("inside second ");
      await getUserTypeFromApi(token);
      return;
    } else if (token.isNotEmpty && !isRememberMeActive) {
      print("inside third ");
      userType.value = UserType.guest;
      targetRout = '/';
      return;
    }
    await getUserTypeFromApi(token);
  }

  getUserTypeFromApi(token) async {
    Either<ErrorResponse, Map<String, dynamic>> response;
    response = await ApiHelper.makeRequest(
      targetRout: ServerConstApis.user,
      method: "GET",
      token: token,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      userType.value = UserType.guest;
    } else {
      String userTypeStr = handlingResponse['usertype'] ?? 'user';
      isEmailVerified.value = handlingResponse['email_verified_at'] != null;
      targetRout = isEmailVerified.value
          ? '/MainBottomNavigationBarWidget'
          : '/VerifyEmailScreen';
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
