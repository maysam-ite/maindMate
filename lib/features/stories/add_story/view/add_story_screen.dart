import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/text_fileds/custom_text_filed.dart';
import 'package:maindmate/core/shared/widgets/bottom_sheet/show_bottom_sheet_for_images_videos.dart';
import 'package:maindmate/core/shared/widgets/general_app_bar.dart';
import 'package:maindmate/features/stories/add_story/controller/add_story_controller.dart';
import 'package:maindmate/main.dart';

import '../../../../core/shared/widgets/videos/cards_local_video_widget .dart';

class AddStoryScreen extends StatelessWidget {
  AddStoryScreen({super.key});
  final AddStoryController addStoryController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryBackground,
      appBar: generalAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showBottomSheetForImagesAndVideos(
                    context: context,
                    onPressCamera: () {
                      Get.back();
                      addStoryController.pickMediaForStory(ImageSource.camera);
                    },
                    onPressGallery: () async {
                      Get.back();
                      addStoryController.pickMediaForStory(ImageSource.gallery);
                    },
                    onPressVideo: () async {
                      addStoryController.pickVideoForStory();
                    });
              },
              child: Stack(
                children: [
                  Container(
                    width: 300.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                        color: appTheme.primaryBackground,
                        borderRadius: BorderRadius.circular(40.r),
                        border: Border.all(),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5)
                        ]),
                    child: addStoryController.media != null
                        ? addStoryController.media!.isVideo
                            ? CardsLocalVideoWidget(
                                currentVideoUrl:
                                    addStoryController.media!.data,
                                videoHgiht: 200.h,
                                videoWidth: 300.w)
                            : Image.file(
                                addStoryController.media!.data,
                              )
                        : const Center(
                            child: Icon(
                            Icons.add,
                            size: 100,
                            color: Color(0xFF000000),
                          )),
                  ),
           addStoryController.media==null?const SizedBox():       Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(Icons.remove_circle, color: appTheme.primary))
                ],
              ),
            ),
            customTextField(
                // height: 200,
                label: tr('email'),
                controller: addStoryController.storyText,
                validator: (val) {
                  return null;
                  // return emailValidation(val);
                }),
            UploadButton(addStoryController: addStoryController),
          ].divide(const SizedBox(
            height: 50,
          )),
        ),
      ),
    );
  }
}

class UploadButton extends StatelessWidget {
  const UploadButton({
    super.key,
    required this.addStoryController,
  });

  final AddStoryController addStoryController;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      showLoadingIndicator: addStoryController.isLoading.value,
      onPressed: () {
        addStoryController.onPressContinue();
      },
      text: tr('upload'),
      options: ButtonOptions(
        width: MediaQuery.sizeOf(context).width * 0.6,
        height: 50,
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: appTheme.primary,
        textStyle: appTheme.text18.copyWith(color: Colors.white),
        elevation: 3,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
