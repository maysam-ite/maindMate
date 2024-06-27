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
import 'package:maindmate/features/doctor/profile/model/doctor_profile_model.dart';
import 'package:maindmate/features/patient/profile/model/patient_model.dart';
import 'package:maindmate/main.dart';

class DoctorProfileController extends GetxController {
  late final Doctor doctor;
  DateTime? doctorBirthDay;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController nickName = TextEditingController();
  final TextEditingController newSpecialtieName = TextEditingController();
  RxString gender = ''.obs;
  File? profilePictuer;
  File? profileVideo;
  String? country;
  String? language;
  RxBool isLoading = false.obs;
  RxList<String> specialtiesList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    doctor = Doctor.fromJson(fakeDoctorProfile);
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

  void pickVideo() async {
    final pickedVideo =
        await imagePicker.pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      profileVideo = File(pickedVideo.path);
      ///// for isart the custom image iside avatar list on selected position
      update();
      Get.back();
    }
  }

  void removeSelectedVideo() {
    profileVideo = null;
    update();
  }

  addNewSpecialtie() {
    specialtiesList.add(newSpecialtieName.text);
    newSpecialtieName.clear();
  }

  removeSpecialtie(int index) {
    specialtiesList.removeAt(index);
  }

  onPressSave() async {
    isLoading.value = true;
    Either<ErrorResponse, Map<String, dynamic>> response;
    String token = await storeService.readString('token');
    Map<String, File> files = {};
    if (profilePictuer != null) {
      files['image'] = profilePictuer!;
    }
    Map<String, dynamic> data = {
      "full_name": fullName.text,
      "nick_name": nickName.text,
      "sex": gender.value == '' ? null : gender.value,
      "birthdate": DateFormat.yMd(doctor),
      "language": language,
      "country": country,
    };
    response = await ApiHelper.makeRequest(
        targetRout: ServerConstApis.patientProfile,
        method: "Post",
        files: files,
        token: token,
        data: data);
    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      // isLoading.value = false;
      SnackbarManager.showSnackbar(handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      whenResponseSuccess(handlingResponse);
    }
  }

  whenResponseSuccess(handlingResponse) {}
}

Map<String, dynamic> fakeDoctorProfile = {
  "id": 2,
  "name": "abood1",
  "email": "abood@gmail.com1",
  "phone": "09488422601",
  "email_verified_at": null,
  "two_factor_secret": null,
  "two_factor_recovery_codes": null,
  "usertype": "user",
  "created_at": "2024-06-11T18:50:48.000000Z",
  "updated_at": "2024-06-11T18:50:48.000000Z",
  "ratings_avg_rating": "4.5000",
  "doctorprofile": {
    "id": 2,
    "user_id": 2,
    "full_name": "عبد المهيمن حموري",
    "nick_name": "abood",
    "sex": "female",
    "birthdate": "1987-06-10",
    "language": null,
    "country": null,
    "image": null,
    "video": null,
    "created_at": "2024-06-19T12:42:16.000000Z",
    "updated_at": "2024-06-19T12:43:07.000000Z",
    "image_url": null,
    "video_url": null
  },
  "ratings": [
    {
      "id": 4,
      "user_id": 2,
      "rated_by": 1,
      "rating": 4,
      "comment": "تعليق مرافق للتقييم",
      "created_at": "2024-06-19T13:22:54.000000Z",
      "updated_at": "2024-06-19T13:22:54.000000Z"
    },
    {
      "id": 5,
      "user_id": 2,
      "rated_by": 2,
      "rating": 5,
      "comment": "تعليق مرافق للتقييم",
      "created_at": "2024-06-19T13:23:23.000000Z",
      "updated_at": "2024-06-19T13:23:23.000000Z"
    }
  ],
  "specialties": [
    {"id": 5, "user_id": 2, "specialty": "رهاب اجتماعي"},
    {"id": 3, "user_id": 2, "specialty": "قلق"},
    {"id": 1, "user_id": 2, "specialty": "قلق اجتماعي"}
  ],
  "experiences": [
    {
      "id": 1,
      "user_id": 2,
      "ed_ex_ce": "education",
      "title": "هندسة اتصالات",
      "from": "جامعة دمشق",
      "start_date": "2007-01-01",
      "end_date": "2012-01-01"
    },
    {
      "id": 3,
      "user_id": 2,
      "ed_ex_ce": "education",
      "title": "ماستر علوم ويب",
      "from": "جامعة دمشق",
      "start_date": "2007-01-01",
      "end_date": "2012-01-01"
    },
    {
      "id": 5,
      "user_id": 2,
      "ed_ex_ce": "experience",
      "title": "خبرة برمجية",
      "from": "شركة أ",
      "start_date": "2020-01-01",
      "end_date": "2021-01-01"
    }
  ]
};
