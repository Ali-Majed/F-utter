class ApiSettings {
  static const String _baseUrl = "http://demo-api.mr-dev.tech/api/";
  static const String user = "${_baseUrl}users";
  static const String login = "${_baseUrl}students/auth/login";
  static const String logout = "${_baseUrl}students/auth/logout";
  static const String images = "${_baseUrl}student/images/{id}";
  static const String tasks = "${_baseUrl}tasks/{id}";


}