import 'dart:convert';

import 'package:maindmate/features/stories/stories/model/story_comment_model.dart';

class StoryModel {
  final int id;
  final int userId;
  final int storyCommentsCount;
  final String storyAuthor;
  final String authorImage;
  final String text;
  final String? image;
  final String? video;
  final String status;
  final String? imageUrl;
  final String? videoUrl;
  final List<StoryCommentModel> storyComments;
  const StoryModel({
    required this.id,
    required this.userId,
    required this.text,
    required this.image,
    required this.video,
    required this.status,
    required this.imageUrl,
    required this.videoUrl,
    required this.storyComments,
    required this.storyCommentsCount,
    required this.storyAuthor,
    required this.authorImage,
  });

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    print("story ${map['story_comments']}");
    return StoryModel(
      id: (map['id'].toInt() ?? 0) as int,
      userId: (int.parse(map['user_id'] ?? '0')),
      text: (map['text'] ?? '') as String,
      image: map['image'],
      video: map['video'],
      status: (map['status'] ?? '') as String,
      imageUrl: map['image_url'],
      videoUrl: map['video_url'],
      storyCommentsCount: int.parse(map['story_comments_count'] ?? '0'),
      storyAuthor: map['story_author'] ?? "Unkown",
      // authorImage: map['author_image'] is List ? '' : map['author_image'],
      authorImage: '',
      storyComments: map['story_comments'] != null
          ? List<StoryCommentModel>.from(
              map['story_comments'].map((x) => StoryCommentModel.fromMap(x)))
          : [],
    );
  }

  factory StoryModel.fromJson(String source) =>
      StoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
