import 'dart:convert';

class StoryCommentModel {
  final int id;
  final int storyId;
  final int userId;
  final String text;
  final String status;
  final String commentAuthor;
  const StoryCommentModel({
    required this.id,
    required this.storyId,
    required this.userId,
    required this.text,
    required this.status,
    required this.commentAuthor,
  });

  factory StoryCommentModel.fromMap(Map<String, dynamic> map) {
    return StoryCommentModel(
      id: ((map['id'] ?? 0)),
      storyId: (int.parse(map['story_id'] ?? "0")),
      userId: (int.parse(map['user_id'] ?? "0")),
      text: (map['text'] ?? '') as String,
      status: (map['status'] ?? '') as String,
      commentAuthor: (map['comment_author'] ?? '') as String,
    );
  }

  factory StoryCommentModel.fromJson(String source) =>
      StoryCommentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
