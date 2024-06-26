import 'dart:convert';


class StoryCommentModel  {
  final int id;
  final int storyId;
  final int userId;
  final String text;
  final String status;
  const StoryCommentModel({
    required this.id,
    required this.storyId,
    required this.userId,
    required this.text,
    required this.status,
  });

 
  factory StoryCommentModel.fromMap(Map<String, dynamic> map) {
    return StoryCommentModel(
      id: (map['id'].toInt() ?? 0) as int,
      storyId: (map['story_id'].toInt() ?? 0) as int,
      userId: (map['user_id'].toInt() ?? 0) as int,
      text: (map['text'] ?? '') as String,
      status: (map['status'] ?? '') as String,
    );
  }


  factory StoryCommentModel.fromJson(String source) => StoryCommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  
}