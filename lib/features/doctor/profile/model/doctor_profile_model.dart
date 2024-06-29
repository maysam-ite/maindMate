import 'package:maindmate/core/shared/model/user_model.dart';

class Doctor extends User {
  final DoctorProfile profile;
  final List<Rating> ratings;
  final List<Specialty> specialties;
  final List<Experience> experiences;

  Doctor({
    required int id,
    required String name,
    required String email,
    required String phone,
    String? emailVerifiedAt,
    String? twoFactorSecret,
    String? twoFactorRecoveryCodes,
    required String userType,
    required this.profile,
    required this.ratings,
    required this.specialties,
    required this.experiences,
  }) : super(
          id: id,
          name: name,
          email: email,
          phone: phone,
          emailVerifiedAt: emailVerifiedAt,
          twoFactorSecret: twoFactorSecret,
          twoFactorRecoveryCodes: twoFactorRecoveryCodes,
          userType: userType,
        );

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      emailVerifiedAt: json['email_verified_at'],
      twoFactorSecret: json['two_factor_secret'],
      twoFactorRecoveryCodes: json['two_factor_recovery_codes'],
      userType: json['usertype'],
      profile: DoctorProfile.fromJson(json['doctorprofile']),
      ratings:
          List<Rating>.from(json['ratings'].map((x) => Rating.fromJson(x))),
      specialties: List<Specialty>.from(
          json['specialties'].map((x) => Specialty.fromJson(x))),
      experiences: List<Experience>.from(
          json['experiences'].map((x) => Experience.fromJson(x))),
    );
  }
}

class DoctorProfile {
  final int id;
  final int userId;
  final String fullName;
  final String nickName;
  final String sex;
  final String birthdate;
  final String? language;
  final String? country;
  final String? image;
  final String? video;
  final String createdAt;
  final String updatedAt;
  final String? imageUrl;
  final String? videoUrl;

  DoctorProfile({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.nickName,
    required this.sex,
    required this.birthdate,
    this.language,
    this.country,
    this.image,
    this.video,
    required this.createdAt,
    required this.updatedAt,
    this.imageUrl,
    this.videoUrl,
  });

  factory DoctorProfile.fromJson(Map<String, dynamic> json) {
    return DoctorProfile(
      id: json['id'],
      userId: json['user_id'],
      fullName: json['full_name'],
      nickName: json['nick_name'],
      sex: json['sex'],
      birthdate: json['birthdate'],
      language: json['language'],
      country: json['country'],
      image: json['image'],
      video: json['video'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imageUrl: json['image_url'],
      videoUrl: json['video_url'],
    );
  }
}

class Rating {
  final int id;
  final int userId;
  final int ratedBy;
  final int rating;
  final String comment;
  final String createdAt;
  final String updatedAt;

  Rating({
    required this.id,
    required this.userId,
    required this.ratedBy,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      userId: json['user_id'],
      ratedBy: json['rated_by'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Specialty {
  final int id;
  final int userId;
  final String specialty;

  Specialty({
    required this.id,
    required this.userId,
    required this.specialty,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) {
    return Specialty(
      id: json['id'],
      userId: json['user_id'],
      specialty: json['specialty'],
    );
  }
}

class Experience {
  final int id;
  final String edExCe;
  final String title;
  final String from;
  final DateTime startDate;
  final DateTime endDate;

  Experience({
    required this.id,
    required this.edExCe,
    required this.title,
    required this.from,
    required this.startDate,
    required this.endDate,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'],
      edExCe: json['ed_ex_ce'],
      title: json['title'],
      from: json['from'],
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'])
          : DateTime.now(),
      endDate: json['end_date'] != null
          ? DateTime.parse(json['end_date'])
          : DateTime.now(),
    );
  }
}
