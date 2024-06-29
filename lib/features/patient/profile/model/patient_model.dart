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
      name: json['name'] ?? "Unknown",
      email: json['email'] ?? '',
      phone: json['phone'] ?? "",
      emailVerifiedAt: json['email_verified_at'],
      twoFactorSecret: json['two_factor_secret'],
      twoFactorRecoveryCodes: json['two_factor_recovery_codes'],
      userType: json['usertype'] ?? "User",
      profile: json['patientprofile'] != null
          ? PatientProfile.fromJson(json['patientprofile'])
          : PatientProfile(userId: json['id'] ?? 0),
    );
  }
}

class PatientProfile {
  final int? id;
  final int userId;
  final String? fullName;
  final String? nickName;
  final String? sex;
  final String? birthdate;
  final String? language;
  final String? country;
  final String? image;
  final String? drugHistory;
  final String? medicalHistory;
  final String? createdAt;
  final String? updatedAt;
  final String? imageUrl;

  PatientProfile({
    this.id,
    required this.userId,
    this.fullName,
    this.nickName,
    this.sex,
    this.birthdate,
    this.language,
    this.country,
    this.image,
    this.drugHistory,
    this.medicalHistory,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
  });

  factory PatientProfile.fromJson(Map<String, dynamic> json) {
    return PatientProfile(
      id: json['id'] as int?,
      userId: int.parse(json['user_id'] ?? 0),
      fullName: json['full_name'] as String?,
      nickName: json['nick_name'] as String?,
      sex: json['sex'] as String?,
      birthdate: json['birthdate'] as String?,
      language: json['language'] as String?,
      country: json['country'] as String?,
      image: json['image'] as String?,
      drugHistory: json['drug_history'] as String?,
      medicalHistory: json['medical_history'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      imageUrl: json['image_url'] as String?,
    );
  }
}
