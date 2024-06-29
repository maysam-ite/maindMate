class ServerConstApis {
  static String baseAPI = 'https://mindmate.a2hosted.com';
  // static String baseAPI = 'http://10.0.2.2:8000';

///// auth
  static String register = '$baseAPI/api/auth/register';
  static String signIn = '$baseAPI/api/auth/login';
  static String logout = '$baseAPI/api/auth/logout';
//////////// user
  static String user = '$baseAPI/api/user';

  ///////story
  static String stories = '$baseAPI/api/stories';
  ///////storycomments
  static String storyComments = '$baseAPI/api/storycomments';
  ///////patient profile
  static String patientProfile = '$baseAPI/api/patientprofile';
}
