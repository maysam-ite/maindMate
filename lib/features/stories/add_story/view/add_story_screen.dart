import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/shared/buttons/general_button.dart';
import 'package:maindmate/core/shared/text_fileds/custom_text_filed.dart';
import 'package:maindmate/core/shared/widgets/general_app_bar.dart';
import 'package:maindmate/features/stories/add_story/controller/add_story_controller.dart';
import 'package:maindmate/main.dart';

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
            Container(
              width: 300.w,
              height: 200.h,
              decoration: BoxDecoration(
                color: appTheme.primaryBackground,
                borderRadius: BorderRadius.circular(40.r)
                ,border: Border.all(),
                 boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5)
            ]
              ),
              child: const Center(child:  Icon(Icons.add,size: 100,color: Color(0xFF000000),)),
            ),
            customTextField(
                // height: 200,
                label: tr('email'),
                controller: addStoryController.storyText,
                validator: (val) {
                  // return emailValidation(val);
                }),
            UploadButton(addStoryController: addStoryController),
          ],
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
