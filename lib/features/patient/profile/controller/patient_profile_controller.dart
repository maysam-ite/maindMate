import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/shared/widgets/snackbar_manager.dart';
import 'package:maindmate/features/patient/profile/model/patient_model.dart';
import 'package:maindmate/main.dart';

class PatientProfileController extends GetxController {
  late final Patient patient;
  DateTime? patientBirthDay;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController nickName = TextEditingController();
  final TextEditingController drugHistory = TextEditingController();
  final TextEditingController medicalHistory = TextEditingController();
  RxString gender = ''.obs;
  File? profilePictuer;
  String? country;
  String? language;
  RxBool isLoading = false.obs;
  RxBool isLoadingPage = false.obs;
  @override
  void onInit() async {
    super.onInit();
    await getPatientprofile();
  }

  void populateFieldsWithProfileData(PatientProfile profile) {
    fullName.text = profile.fullName ?? '';
    nickName.text = profile.nickName ?? '';
    drugHistory.text = profile.drugHistory ?? '';
    medicalHistory.text = profile.medicalHistory ?? '';
    gender.value = profile.sex ?? '';
    patientBirthDay =
        profile.birthdate != null ? DateTime.parse(profile.birthdate!) : null;
    country = profile.country == 'null' ? null : profile.country;
    language = profile.language == 'null' ? null : profile.language;
  }

  Future<void> getPatientprofile() async {
    isLoadingPage.value = true;
    Either<ErrorResponse, Map<String, dynamic>> response;
    String token = await storeService.readString("token");
    print(token);
    response = await ApiHelper.makeRequest(
      targetRout: '${ServerConstApis.patientProfile}',
      method: "GET",
      token: token,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      // Handle error appropriately
      isLoadingPage.value = false;
    } else {
      patient = Patient.fromJson(handlingResponse);
      populateFieldsWithProfileData(patient.profile);
      isLoadingPage.value = false;

      update();
    }
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
    String token = await storeService.readString('token');
    print(token);
    Map<String, File> files = {};
    if (profilePictuer != null) {
      files['image'] = profilePictuer!;
    }
    Map<String, dynamic> data = {
      "full_name": fullName.text,
      "nick_name": nickName.text,
      "sex": gender.value.isEmpty ? null : gender.value,
      "birthdate": patientBirthDay?.toIso8601String(),
      "drug_history": drugHistory.text.isEmpty ? null : drugHistory.text,
      "medical_history":
          medicalHistory.text.isEmpty ? null : medicalHistory.text,
      "_method": "PATCH"
    };

    if (language != null && language!.isNotEmpty) {
      data['language'] = language;
    }
    if (country != null && country!.isNotEmpty) {
      data['country'] = country;
    }

    data.removeWhere((key, value) => value == null);
    response = await ApiHelper.makeRequest(
        targetRout: ServerConstApis.patientProfile,
        method: "Post",
        files: files,
        token: token,
        data: data);
    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      isLoading.value = false;
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      isLoading.value = false;
      whenResponseSuccess(handlingResponse);
    }
  }

  whenResponseSuccess(handlingResponse) {}
}
