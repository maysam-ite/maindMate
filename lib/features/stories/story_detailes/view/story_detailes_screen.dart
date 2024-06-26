import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/text_fileds/custom_text_filed.dart';
import 'package:maindmate/core/shared/widgets/images/network_image.dart';
import 'package:maindmate/core/shared/widgets/videos/cards_video_widget.dart';
import 'package:maindmate/features/stories/stories/model/story_comment_model.dart';
import 'package:maindmate/features/stories/story_detailes/controller/story_detailes_controller.dart';
import 'package:maindmate/main.dart';

class StoryDetailesScreen extends StatelessWidget {
  StoryDetailesScreen({super.key});
  final StoryDetailesController storyDetailesController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/Component.png',
                width: 30,
                height: 30,
              ),
            ),
          ],
          title: Text('Centered Title'),
          surfaceTintColor: appTheme.primaryBackground,
          centerTitle: true),
      body: Column(
        children: [
          PostWidget(storyDetailesController: storyDetailesController),
          SendComment(storyDetailesController: storyDetailesController)
        ],
      ),
    );
  }
}

class SendComment extends StatelessWidget {
  const SendComment({
    super.key,
    required this.storyDetailesController,
  });

  final StoryDetailesController storyDetailesController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: customTextField(
              label: 'comment',
              validator: (value) {
                return null;
              },
              controller: storyDetailesController.comment),
        ),
        Obx(() => 
        IconButton(
            onPressed: () {
              storyDetailesController.sendComment();
            },
            icon: Icon(
              Icons.send_rounded,
              color:storyDetailesController.isLoadingSendComment.value || storyDetailesController.comment.text.isEmpty?appTheme.primary.withOpacity(0.5): appTheme.primary,
            ))
      
        )
        ],
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.storyDetailesController,
  });

  final StoryDetailesController storyDetailesController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            storyDetailesController.storyModel.video != null
                ? CardsVideoWidget(
                    currentVideoUrl: storyDetailesController.storyModel.video!,
                    videoHgiht: 195.h,
                    videoWidth: double.infinity,
                  )
                :
                // SizedBox():
                SizedBox(
                    height: 275.h,
                    child: getImageNetwork(
                        url: storyDetailesController.storyModel.image!,
                        width: null,
                        height: 275.h))

            // Container(
            //   height: 275.h,
            //   // decoration:
            //   //     BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
            //   child: Image.asset(
            //     'assets/images/post.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            ,
            PostHeader(),
            PostComments(
              storyComments: storyDetailesController.storyModel.storyComments,
            )
          ],
        ),
      ),
    );
  }
}

class PostComments extends StatelessWidget {
  const PostComments({super.key, required this.storyComments});
  final List<StoryCommentModel> storyComments;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            storyComments.length,
            (index) => PostCommentsCard(
                  storyCommentModel: storyComments[index],
                ))
      ],
    );
  }
}

class PostCommentsCard extends StatelessWidget {
  const PostCommentsCard({super.key, required this.storyCommentModel});
  final StoryCommentModel storyCommentModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: appTheme.primaryBackground,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 33.w,
                height: 33.h,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: Image.asset('assets/images/Component.png'),
              ),
              Text(
                'أحمد محمد احمد',
                style: appTheme.text16,
              ),
            ].divide(SizedBox(
              width: 10.w,
            )),
          ),
          Text(
            storyCommentModel.text,
            style: appTheme.text14,
          ),
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  PostHeader({super.key});
  final StoryDetailesController storyDetailesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: appTheme.primaryBackground,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5)
          ]),
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 33.w,
                height: 33.h,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: Image.asset('assets/images/Component.png'),
              ),
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
              const Spacer(),
              Container(
                width: 38.w,
                height: 38.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: appTheme.lineColor.withOpacity(0.5)),
                child: const Icon(Icons.star_border_outlined),
              ),
            ].divide(SizedBox(
              width: 10.w,
            )),
          ),
          Text(
            storyDetailesController.storyModel.text,
            style: appTheme.text18,
          ),
        ],
      ),
    );
  }
}
