import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/server/helper_api.dart';
import 'package:maindmate/core/server/parse_response.dart';
import 'package:maindmate/core/server/server_config.dart';
import 'package:maindmate/core/shared/widgets/snackbar_manager.dart';
import 'package:maindmate/features/stories/stories/model/story_comment_model.dart';
import 'package:maindmate/features/stories/stories/model/story_model.dart';
import 'package:maindmate/main.dart';

class StoryDetailesController extends GetxController {
  late final int storyIndex;
  final TextEditingController comment = TextEditingController();
  RxBool isLoadingSendComment = false.obs;
  RxBool isLoadingPage = false.obs;
  RxString commentText = ''.obs;
  late StoryModel storyModel;

  @override
  void onInit() async {
    super.onInit();
    storyIndex = Get.arguments;
    await getStoryDetailes();
    comment.addListener(_updateCommentText);
  }

  @override
  void onClose() {
    comment.removeListener(_updateCommentText);
    comment.dispose();
    super.onClose();
  }

  void _updateCommentText() {
    commentText.value = comment.text;
  }

  Future<void> getStoryDetailes() async {
    isLoadingPage.value = true;
    Either<ErrorResponse, Map<String, dynamic>> response;
    String token = await storeService.readString("token");
    response = await ApiHelper.makeRequest(
      targetRout: '${ServerConstApis.stories}/$storyIndex',
      method: "GET",
      token: token,
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      // Handle error appropriately
      isLoadingPage.value = false;
    } else {
      storyModel = StoryModel.fromMap(handlingResponse);
      isLoadingPage.value = false;
      update();
    }
  }

  Future<void> sendComment() async {
    if (comment.text.isEmpty) return;
    isLoadingSendComment.value = true;
    Either<ErrorResponse, Map<String, dynamic>> response;
    String token = await storeService.readString('token');
    response = await ApiHelper.makeRequest(
      targetRout: ServerConstApis.storyComments,
      method: "POST",
      token: token,
      data: {
        'text': comment.text,
        'story_id': storyIndex.toString(),
      },
    );

    dynamic handlingResponse = response.fold((l) => l, (r) => r);
    if (handlingResponse is ErrorResponse) {
      isLoadingSendComment.value = false;
    } else {
      whenResponseSuccess(handlingResponse);
      isLoadingSendComment.value = false;
    }
  }

  void whenResponseSuccess(dynamic handlingResponse) {
    storyModel.storyComments.add(StoryCommentModel.fromMap(handlingResponse));

    comment.clear();
    SnackbarManager.showSnackbar(
      "Your comment was sent",
      backgroundColor: appTheme.success,
    );
    update();
  }
}
