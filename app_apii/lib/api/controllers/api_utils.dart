import 'dart:io';

import 'package:app_apii/pref/shared_pref_controller.dart';

class ApiUtils{
 String? _token;
  Map<String , String> get headers {
    return {
      HttpHeaders.authorizationHeader: authToken,
      HttpHeaders.acceptHeader: "application/json",

    };
  }

  String get authToken {
    return _token ??= SharedPrefController().getValueFor(key: PrefKey.token.name)!;


  }
}