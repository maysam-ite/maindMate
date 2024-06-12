class UserModel {
  int id;
  String name;
  String email;
  String? emailVerifiedAt;
  String? twoFactorSecret;
  String? twoFactorRecoveryCodes;
  String? twoFactorConfirmedAt;
  String createdAt;
  String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor for creating a new user instance from a map structure
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      twoFactorSecret: json['two_factor_secret'],
      twoFactorRecoveryCodes: json['two_factor_recovery_codes'],
      twoFactorConfirmedAt: json['two_factor_confirmed_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // Method to convert UserModel instance to map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'two_factor_secret': twoFactorSecret,
      'two_factor_recovery_codes': twoFactorRecoveryCodes,
      'two_factor_confirmed_at': twoFactorConfirmedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
