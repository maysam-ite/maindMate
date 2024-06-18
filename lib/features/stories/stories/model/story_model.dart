import 'dart:convert';


class StoryModel  {
  final int id;
  final int user_id;
  final String text;
  final String image;
  final String video;
  final String status;
  final String image_url;
  final List<dynamic> story_comments;
  const StoryModel({
    required this.id,
    required this.user_id,
    required this.text,
    required this.image,
    required this.video,
    required this.status,
    required this.image_url,
    required this.story_comments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'text': text,
      'image': image,
      'video': video,
      'status': status,
      'image_url': image_url,
      'story_comments': story_comments,
    };
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      id: (map['id'].toInt() ?? 0) as int,
      user_id: (map['user_id'].toInt() ?? 0) as int,
      text: (map['text'] ?? '') as String,
      image: map['image'] ??"",
      video: map['video']??"" ,
      status: (map['status'] ?? '') as String,
      image_url: (map['image_url'] ?? '') as String,
      story_comments: List<dynamic>.from((map['story_comments'] ?? const <dynamic>[]) as List<dynamic>),
    );
  }


  factory StoryModel.fromJson(String source) => StoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

}
