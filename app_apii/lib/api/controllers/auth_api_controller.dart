import 'dart:convert';
import 'dart:io';
import 'package:app_apii/api/api_settings.dart';
import 'package:app_apii/api/controllers/api_utils.dart';
import 'package:app_apii/models/api_response.dart';
import 'package:app_apii/models/student.dart';
import 'package:app_apii/pref/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class AuthApiController extends ApiUtils {
  Future<ApiResponse> login(String email, String password) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response =
        await http.post(uri, body: {"email": email, "password": password});
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Student student = Student.fromJson(jsonResponse['object']);
        await SharedPrefController().save(student);
      }
      return ApiResponse(jsonResponse['message'], jsonResponse['status']);
    }
    return ApiResponse('Something went wrong , try again !', false);
  }

  Future<ApiResponse> logout() async {
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 401) {
      await SharedPrefController().clear();
      return ApiResponse("Logged out successfully", true);
    }
    return ApiResponse("Something went wrong , try again!", false);
  }
}
