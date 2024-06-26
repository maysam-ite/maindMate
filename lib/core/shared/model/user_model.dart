// Base User class common properties
class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? emailVerifiedAt;
  final String? twoFactorSecret;
  final String? twoFactorRecoveryCodes;
  final String userType;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      emailVerifiedAt: json['email_verified_at'],
      twoFactorSecret: json['two_factor_secret'],
      twoFactorRecoveryCodes: json['two_factor_recovery_codes'],
      userType: json['usertype'],
    );
  }
}


// // Doctor-specific properties
// class Doctor extends User {
//   final DoctorProfile profile;
//   final List<Rating> ratings;
//   final List<Specialty> specialties;
//   final List<Experience> experiences;

//   Doctor({
//     required int id,
//     required String name,
//     required String email,
//     required String phone,
//     String? emailVerifiedAt,
//     String? twoFactorSecret,
//     String? twoFactorRecoveryCodes,
//     required String userType,
//     required String createdAt,
//     required String updatedAt,
//     required this.profile,
//     required this.ratings,
//     required this.specialties,
//     required this.experiences,
//   }) : super(
//           id: id,
//           name: name,
//           email: email,
//           phone: phone,
//           emailVerifiedAt: emailVerifiedAt,
//           twoFactorSecret: twoFactorSecret,
//           twoFactorRecoveryCodes: twoFactorRecoveryCodes,
//           userType: userType,
//           createdAt: createdAt,
//           updatedAt: updatedAt,
//         );
// }
