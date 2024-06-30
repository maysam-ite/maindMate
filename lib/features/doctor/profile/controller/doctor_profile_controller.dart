import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/shared/widgets/snackbar_manager.dart';
import 'package:maindmate/features/doctor/profile/model/doctor_profile_model.dart';
import 'package:maindmate/main.dart';

class DoctorProfileController extends GetxController {
  late final Doctor doctor;
  DateTime? doctorBirthDay;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController nickName = TextEditingController();
  final TextEditingController newSpecialtieName = TextEditingController();
  RxString gender = ''.obs;
  File? profilePicture;
  File? profileVideo;
  String? country;
  String? language;
  RxBool isLoading = false.obs;
  RxBool isLoadingPage = false.obs;
  RxBool isAddingSpecialty = false.obs;
  RxBool isUpdatingSpecialty = false.obs;
  RxBool isDeletingSpecialty = false.obs;
  RxBool isAddingExperience = false.obs;
  RxBool isUpdatingExperience = false.obs;
  RxBool isDeletingExperience = false.obs;
  RxList<Specialty> specialtiesList = <Specialty>[].obs;
  RxList<Experience> generalExperienceList = <Experience>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getDoctorProfile();
  }

  void populateFieldsWithProfileData(Doctor profile) {
    fullName.text = profile.profile.fullName ?? '';
    nickName.text = profile.profile.nickName ?? '';
    gender.value = profile.profile.sex ?? '';
    doctorBirthDay = profile.profile.birthdate != null
        ? DateTime.parse(profile.profile.birthdate!)
        : null;
    country =
        profile.profile.country == 'null' ? null : profile.profile.country;
    language =
        profile.profile.language == 'null' ? null : profile.profile.language;
    specialtiesList.value = profile.specialties;
    generalExperienceList.value = profile.experiences;
  }

  Future<void> getDoctorProfile() async {
    isLoadingPage.value = true;
    Either<ErrorResponse, Map<String, dynamic>> response;
    String token = await storeService.readString("token");
    response = await ApiHelper.makeRequest(
      targetRout: '${ServerConstApis.doctorProfile}',
      method: "GET",
      token: token,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      isLoadingPage.value = false;
    } else {
      doctor = Doctor.fromJson(handlingResponse);
      populateFieldsWithProfileData(doctor);
      isLoadingPage.value = false;
      update();
    }
  }

  final imagePicker = ImagePicker();
  void pickImage(ImageSource imageSource) async {
    final pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage != null) {
      profilePicture = File(pickedImage.path);
      update();
      Get.back();
    }
  }

  void pickVideo() async {
    final pickedVideo =
        await imagePicker.pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      profileVideo = File(pickedVideo.path);
      update();
      Get.back();
    }
  }

  void removeSelectedVideo() {
    profileVideo = null;
    update();
  }

  Future<void> addNewSpecialtie() async {
    isAddingSpecialty.value = true;
    String token = await storeService.readString("token");
    Map<String, dynamic> data = {
      "specialty": newSpecialtieName.text,
    };

    Either<ErrorResponse, Map<String, dynamic>> response =
        await ApiHelper.makeRequest(
      targetRout: ServerConstApis.storespecialty,
      method: "POST",
      token: token,
      data: data,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      specialtiesList.add(Specialty.fromJson(handlingResponse));
      newSpecialtieName.clear();
    }
    isAddingSpecialty.value = false;
    update();
  }

  Future<void> updateSpecialtie(int id, String specialty) async {
    isUpdatingSpecialty.value = true;
    String token = await storeService.readString("token");
    Map<String, dynamic> data = {"specialty": specialty, "_method": "PUT"};

    Either<ErrorResponse, Map<String, dynamic>> response =
        await ApiHelper.makeRequest(
      targetRout: '${ServerConstApis.updateSpecialty}/$id',
      method: "POST",
      token: token,
      data: data,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      int index = specialtiesList.indexWhere((s) => s.id == id);
      if (index != -1) {
        specialtiesList[index] = Specialty.fromJson(handlingResponse);
      }
    }
    isUpdatingSpecialty.value = false;
    update();
  }

  Future<void> removeSpecialtie(int id) async {
    isDeletingSpecialty.value = true;
    String token = await storeService.readString("token");

    Either<ErrorResponse, Map<String, dynamic>> response =
        await ApiHelper.makeRequest(
      targetRout: '${ServerConstApis.deleteSpecialty}/$id',
      method: "DELETE",
      token: token,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      specialtiesList.removeWhere((s) => s.id == id);
    }
    isDeletingSpecialty.value = false;
    update();
  }

  Future<void> addNewExperience(String edExCe, String title,
      String experienceFrom, DateTime? startDate, DateTime? endDate) async {
    isAddingExperience.value = true;
    String token = await storeService.readString("token");
    Map<String, dynamic> data = {
      "ed_ex_ce": edExCe,
      "title": title,
      "from": experienceFrom,
      "start_date": startDate?.toIso8601String(),
      "end_date": endDate?.toIso8601String(),
    };

    Either<ErrorResponse, Map<String, dynamic>> response =
        await ApiHelper.makeRequest(
      targetRout: ServerConstApis.addExperience,
      method: "POST",
      token: token,
      data: data,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      generalExperienceList.add(Experience.fromJson(handlingResponse));
    }
    isAddingExperience.value = false;
    update();
  }

  Future<void> updateExistExperience(int id, String edExCe, String title,
      String experienceFrom, DateTime? startDate, DateTime? endDate) async {
    isUpdatingExperience.value = true;
    String token = await storeService.readString("token");
    Map<String, dynamic> data = {
      "ed_ex_ce": edExCe,
      "title": title,
      "from": experienceFrom,
      "start_date": startDate?.toIso8601String(),
      "end_date": endDate?.toIso8601String(),
      "_method": "PUT"
    };

    Either<ErrorResponse, Map<String, dynamic>> response =
        await ApiHelper.makeRequest(
      targetRout: '${ServerConstApis.updateExperience}/$id',
      method: "POST",
      token: token,
      data: data,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      int index = generalExperienceList.indexWhere((e) => e.id == id);
      if (index != -1) {
        generalExperienceList[index] = Experience.fromJson(handlingResponse);
      }
    }
    isUpdatingExperience.value = false;
    update();
  }

  Future<void> removeExistExperience(int id) async {
    print("hhhhhhhhhhhhhh+$id");
    isDeletingExperience.value = true;
    String token = await storeService.readString("token");

    Either<ErrorResponse, Map<String, dynamic>> response =
        await ApiHelper.makeRequest(
      targetRout: '${ServerConstApis.deleteExperience}/$id',
      method: "DELETE",
      token: token,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      print("hhhhhhhhhhhhhh+$handlingResponse");

      generalExperienceList.removeWhere((e) => e.id == id);
    }
    isDeletingExperience.value = false;
    update();
  }

  onPressSave() async {
    isLoading.value = true;
    Either<ErrorResponse, Map<String, dynamic>> response;
    String token = await storeService.readString('token');
    Map<String, File> files = {};
    if (profilePicture != null) {
      files['image'] = profilePicture!;
    }
    if (profileVideo != null) {
      files['video'] = profileVideo!;
    }
    Map<String, dynamic> data = {
      "full_name": fullName.text,
      "nick_name": nickName.text,
      "sex": gender.value == '' ? null : gender.value,
      "birthdate": doctorBirthDay.toString(),
      "language": language,
      "country": country,
    };
    response = await ApiHelper.makeRequest(
      targetRout: ServerConstApis.doctorProfile,
      method: "Post",
      files: files,
      token: token,
      data: data,
    );
    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      whenResponseSuccess(handlingResponse);
    }
  }

  whenResponseSuccess(handlingResponse) {
    isLoading.value = false;
    // Handle successful response
  }
}
