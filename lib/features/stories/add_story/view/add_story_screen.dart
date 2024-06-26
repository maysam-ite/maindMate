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
      appBar: generalAppBar(title:'add_story'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(

          children: [
            UserInformation(),
            AddStoryContent(addStoryController: addStoryController)
             ].divide(const SizedBox(
            height: 30,
          )),
        ),
      ),
    );
  }
}

class AddStoryContent extends StatelessWidget {
  const AddStoryContent({
    super.key,
    required this.addStoryController,
  });

  final AddStoryController addStoryController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.w),
      decoration: BoxDecoration(
        color:appTheme.primaryBackground,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5)]
      ),
      child:Column(
        children:[
    
       customTextField(
        maxLines:6,
        label: tr('type_here_what_you_want'),
        controller: addStoryController.storyText,
        validator: (val) {
          return null;
          // return emailValidation(val);
        }),
    Align(
      alignment: AlignmentDirectional(-1,0),
      child: GestureDetector(
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
        child: GetBuilder<AddStoryController>(
          builder: (context) {
            return Stack(
              children: [
                Container(
                  width: 86.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: appTheme.primaryBackground,
                      borderRadius: BorderRadius.circular(9.r),
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
                              videoHgiht: 86.h,
                              videoWidth: 60.w)
                          : Image.file(
                              addStoryController.media!.data,
                                  width: 86.w,
                  height: 60.h,
              fit: BoxFit.contain,
                            )
                      : const Center(
                          child: Icon(
                          Icons.add,
                          size: 30,
                          color: Color(0xFF000000),
                        )),
                ),
                       addStoryController.media==null?const SizedBox():       Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(Icons.cancel, color: appTheme.error))
              ],
            );
          }
        ),
      ),
    ),
            
    UploadButton(addStoryController: addStoryController),
              
        ].divide(const SizedBox(
    height: 50,
              ))
      )
    );
  }
}
class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children:[
        Container(
          width: 33.w,
          height: 33.h,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.blue)),
          child: Image.asset('assets/images/Component.png'),
        ),
        SizedBox(width:5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'أحمد محمد احمد',
              style: appTheme.text16,
            ),
            Text(
              'المنصب او الاشتراك',
              style: appTheme.text10,
            ),
          ],
        ),
      ]
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
      text: tr('publish_story'),
      options: ButtonOptions(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 55.h,
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: appTheme.secondary,
        textStyle: appTheme.text18.copyWith(color: Colors.white),
        elevation: 3,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
