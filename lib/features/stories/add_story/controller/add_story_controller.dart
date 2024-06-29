// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/shared/widgets/snackbar_manager.dart';
import 'package:maindmate/features/main_bottom_navigation_bar/controller/main_bottom_navigation_controller.dart';
import 'package:maindmate/main.dart';

class AddStoryController extends GetxController {
  TextEditingController storyText = TextEditingController();
  RxBool isLoading = false.obs;

  MediaType? media;
  final imagePicker = ImagePicker();
  void pickMediaForStory(ImageSource imageSource) async {
    final pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage != null) {
      media = MediaType(isVideo: false, data: File(pickedImage.path));
      update();
      Get.back();
    }
  }

  pickVideoForStory() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedVideo =
        await picker.pickVideo(source: ImageSource.gallery);

    media != null
        ? MediaType(isVideo: false, data: File(pickedVideo!.path))
        : null;
  }

  deleteSelectedMedia() {
    media = null;
  }

  onPressContinue() async {
    isLoading.value = true;
    Either<ErrorResponse, Map<String, dynamic>> response;
    String token=await storeService.readString('token');
    Map<String, File> files = {};
    if (media != null) {
      media!.isVideo
          ? files['video'] = media!.data
          : files['image'] = media!.data;
    }
    response = await ApiHelper.makeRequest(
        targetRout: ServerConstApis.stories,
        method: "Post",
        files: files,
        token:token,
        data: {
          'text': storyText.text,
        });
    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      isLoading.value = false;
      SnackbarManager.showSnackbar(
          handlingResponse.message!,
          backgroundColor: appTheme.error);
    } else {
      whenResponseSuccess(handlingResponse);
    }
  }

  whenResponseSuccess(handlingResponse) {
     SnackbarManager.showSnackbar(
          "uplaod new story success!!",
          backgroundColor: appTheme.success);
    Get.find<MainBottomNavigationController>().changePage(0);
  }
}

class MediaType {
  bool isVideo;
  File data;
  MediaType({
    required this.isVideo,
    required this.data,
  });
}
