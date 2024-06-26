// Patient-specific properties
import 'package:maindmate/core/shared/model/user_model.dart';

class Patient extends User {
  final PatientProfile profile;

  Patient({
    required int id,
    required String name,
    required String email,
    required String phone,
    String? emailVerifiedAt,
    String? twoFactorSecret,
    String? twoFactorRecoveryCodes,
    required String userType,
    required this.profile,
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

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] ?? 0,
      name: json['name'] ?? "UnKnown",
      email: json['email'] ?? '',
      phone: json['phone'] ?? "",
      emailVerifiedAt: json['email_verified_at'],
      twoFactorSecret: json['two_factor_secret'],
      twoFactorRecoveryCodes: json['two_factor_recovery_codes'],
      userType: json['usertype'] ?? "User",
      profile: PatientProfile.fromJson(json['patientprofile']),
    );
  }
}

class PatientProfile {
  final int id;
  final int userId;
  final String fullName;
  final String nickName;
  final String sex;
  final String birthdate;
  final String? language;
  final String? country;
  final String? image;
  final String? drugHistory;
  final String? medicalHistory;
  final String createdAt;
  final String updatedAt;
  final String? imageUrl;

  PatientProfile({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.nickName,
    required this.sex,
    required this.birthdate,
    this.language,
    this.country,
    this.image,
    this.drugHistory,
    this.medicalHistory,
    required this.createdAt,
    required this.updatedAt,
    this.imageUrl,
  });

  factory PatientProfile.fromJson(Map<String, dynamic> json) {
    return PatientProfile(
      id: json['id'],
      userId: json['user_id'],
      fullName: json['full_name'],
      nickName: json['nick_name'],
      sex: json['sex'],
      birthdate: json['birthdate'],
      language: json['language'],
      country: json['country'],
      image: json['image'],
      drugHistory: json['drug_history'],
      medicalHistory: json['medical_history'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imageUrl: json['image_url'],
    );
  }
}
