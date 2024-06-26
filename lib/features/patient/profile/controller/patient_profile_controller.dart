import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/widgets/snackbar_manager.dart';
import 'package:maindmate/features/patient/profile/model/patient_model.dart';
import 'package:maindmate/main.dart';

class PatientProfileController extends GetxController {
  late final Patient patient;
  DateTime? patientBirthDay;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController nickName = TextEditingController();
  final TextEditingController socialStatus = TextEditingController();
  final TextEditingController drugHistory = TextEditingController();
  final TextEditingController medicalHistory = TextEditingController();
  RxString gender = ''.obs;
  File? profilePictuer;
  String? country;
  String? language;
  RxBool isLoading=false.obs;
  @override
  void onInit() {
    super.onInit();
    patient = Patient.fromJson(fakePatientProfile);
  }

  final imagePicker = ImagePicker();
  void pickImage(ImageSource imageSource) async {
    final pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage != null) {
      profilePictuer = File(pickedImage.path);
      ///// for isart the custom image iside avatar list on selected position
      update();
      Get.back();
    }
  }

  onPressSave() async {
      isLoading.value = true;
    Either<ErrorResponse, Map<String, dynamic>> response;
    String token=await storeService.readString('token');
    Map<String, File> files = {};
    if (profilePictuer != null) {
    files['image'] = profilePictuer!;
    }
    Map<String,dynamic> data= {
    "full_name": fullName.text,
    "nick_name": nickName.text,
    "sex": gender.value==''?null:gender.value,
    "birthdate":DateFormat.yMd(patientBirthDay) ,
    "language": language,
    "country": country,
    "drug_history": drugHistory.text,
    "medical_history": medicalHistory.text,
  };
    response = await ApiHelper.makeRequest(
        targetRout: ServerConstApis.patientProfile,
        method: "Post",
        files: files,
        token:token,
        data: data
        );
    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      // isLoading.value = false;
      SnackbarManager.showSnackbar(
          handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      whenResponseSuccess(handlingResponse);
    }
  
  }
  whenResponseSuccess(handlingResponse){

  }
}

Map<String, dynamic> fakePatientProfile = {
  "id": 2,
  "name": "abood1",
  "email": "abood@gmail.com1",
  "phone": "09488422602",
  "email_verified_at": null,
  "two_factor_secret": null,
  "two_factor_recovery_codes": null,
  "usertype": "user",
  "status": "active",
  "created_at": "2024-06-19T16:53:55.000000Z",
  "updated_at": "2024-06-19T16:53:55.000000Z",
  "patientprofile": {
    "id": 1,
    "user_id": 2,
    "full_name": "عبد المهيمن",
    "nick_name": "aboodr",
    "sex": "male",
    "birthdate": "1987-06-09",
    "language": null,
    "country": null,
    "image": null,
    "drug_history": null,
    "medical_history": "سوابق مرضية",
    "created_at": "2024-06-19T17:00:08.000000Z",
    "updated_at": "2024-06-19T17:01:21.000000Z",
    "image_url": null
  }
};
