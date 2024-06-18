class ServerConstApis {
  static String baseAPI = 'http://10.0.2.2:8000';
  static String baseAPIImage = 'https://evento.sy';

///// auth
  static String register = '$baseAPI/api/auth/register';
  static String signIn = '$baseAPI/api/auth/login';

  ///////story
  static String stories = '$baseAPI/api/stories';

}
