import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/services/user_session_service.dart';
import 'package:maindmate/core/shared/widgets/images/network_image.dart';
import 'package:maindmate/core/shared/widgets/videos/cards_video_widget.dart';
import 'package:maindmate/features/stories/stories/model/story_model.dart';
import 'package:maindmate/main.dart';

class StoriesWidget extends StatelessWidget {
  const StoriesWidget({super.key, required this.storyModel});
  final StoryModel storyModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final UserSessionService userSessionService =
            Get.find<UserSessionService>();

        print(userSessionService.userType.value);
        // Get.toNamed('/StoryDetailesScreen',
        //     arguments: storyModel.id, preventDuplicates: false);
      },
      child: Container(
        width: 382.w,
        decoration: BoxDecoration(
            color: appTheme.primaryBackground,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5)
            ]),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            PostHeader(
              storyModel: storyModel,
            ),
            PostContent(
              storyModel: storyModel,
            )
          ],
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.storyModel});
  final StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 33.w,
          height: 33.h,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue),
              image: DecorationImage(
                  image: storyModel.authorImage == ''
                      ? const AssetImage('assets/images/faceBookProfile.jfif')
                      : getImageNetworkImageProvider(
                          url: storyModel.authorImage,
                          width: null,
                          height: null))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              storyModel.storyAuthor,
              style: appTheme.text16,
            ),
            // Text(
            //   'المنصب او الاشتراك',
            //   style: appTheme.text10,
            // ),
          ],
        ),
        const Spacer(),
        Container(
          width: 38.w,
          height: 38.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: appTheme.lineColor.withOpacity(0.5)),
          child: const Icon(Icons.comment_outlined),
        ),
        Text(storyModel.storyCommentsCount.toString())
      ].divide(SizedBox(
        width: 10.w,
      )),
    );
  }
}

class PostContent extends StatelessWidget {
  const PostContent({super.key, required this.storyModel});
  final StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          storyModel.text,
          style: appTheme.text18.copyWith(fontSize: 16),
          maxLines: 5,
        ),
        SizedBox(
          height: 15,
        ),
        storyModel.videoUrl != null
            ? CardsVideoWidget(
                currentVideoUrl: storyModel.videoUrl!,
                videoHgiht: 195.h,
                videoWidth: double.infinity,
              )
            :
            // SizedBox():
            Container(
                height: 195.h,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
                child: getImageNetwork(
                    url: storyModel.imageUrl!, width: null, height: 195.h))
      ],
    );
  }
}
