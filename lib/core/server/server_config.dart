class ServerConstApis {
  static String baseAPI = 'https://mindmate.a2hosted.com';
  // static String baseAPI = 'http://10.0.2.2:8000';

///// auth
  static String register = '$baseAPI/api/auth/register';
  static String signIn = '$baseAPI/api/auth/login';
  static String logout = '$baseAPI/api/auth/logout';
  static String resendVerificationEmail =
      '$baseAPI/api/auth/email/verification-notification';
  static String isVerified = '$baseAPI/api/auth/email/is-verified';
  static String forgotPassword = '$baseAPI/api/auth/forgot-password';
//////////// user
  static String user = '$baseAPI/api/user';

  ///////story
  static String stories = '$baseAPI/api/stories';
  ///////storycomments
  static String storyComments = '$baseAPI/api/storycomments';
  ///////patient profile
  static String patientProfile = '$baseAPI/api/patientprofile';
  ///////doctor
  static String doctorProfile = '$baseAPI/api/doctorprofile';
  static String storespecialty = '$baseAPI/api/storespecialty';
  static String updateSpecialty = '$baseAPI/api/updatespecialty';
  static String deleteSpecialty = '$baseAPI/api/destroyspecialty';
  static String addExperience = '$baseAPI/api/storexperience';
  static String updateExperience = '$baseAPI/api/updatexperience';
  static String deleteExperience = '$baseAPI/api/destroyexperience';
}
