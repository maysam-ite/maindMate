import 'dart:convert';

import 'package:maindmate/features/stories/stories/model/story_comment_model.dart';


class StoryModel  {
  final int id;
  final int userId;
  final String text;
  final String? image;
  final String? video;
  final String status;
  final String imageUrl;
  final List<StoryCommentModel> storyComments;
  const StoryModel({
    required this.id,
    required this.userId,
    required this.text,
    required this.image,
    required this.video,
    required this.status,
    required this.imageUrl,
    required this.storyComments,
  });


  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      id: (map['id'].toInt() ?? 0) as int,
      userId: (map['user_id'].toInt() ?? 0) as int,
      text: (map['text'] ?? '') as String,
      image: map['image'] ,
      video: map['video'] ,
      status: (map['status'] ?? '') as String,
      imageUrl: (map['image_url'] ?? '') as String,
      storyComments: List<StoryCommentModel>.from((map['story_comments'] ?? const <StoryCommentModel>[]) as List<StoryCommentModel>),
    );
  }


  factory StoryModel.fromJson(String source) => StoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

}


