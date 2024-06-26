import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/shared/widgets/snackbar_manager.dart';
import 'package:maindmate/features/stories/stories/model/story_model.dart';
import 'package:maindmate/main.dart';

class StoryDetailesController extends GetxController {
  late final StoryModel storyModel;
  final TextEditingController comment = TextEditingController();
  RxBool isLoadingSendComment = false.obs;
  @override
  void onInit() {
    storyModel = Get.arguments;
    super.onInit();
  }

  sendComment() async {
    if (comment.text.isEmpty || comment.text == '') return;
    isLoadingSendComment.value = true;
    Either<ErrorResponse, Map<String, dynamic>> response;
    String token = await storeService.readString('token');
    response = await ApiHelper.makeRequest(
        targetRout: ServerConstApis.storyComments,
        method: "Post",
        token: token,
        data: {
          'text': comment.text,
          'story_id': storyModel.id,
        });
    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      // isLoading.value = false;
      isLoadingSendComment.value = false;
    } else {
      whenResponseSuccess(handlingResponse);
    }
  }

  whenResponseSuccess(handlingResponse) {
    SnackbarManager.showSnackbar("Your comment send",
        backgroundColor: appTheme.success);
  }
}
