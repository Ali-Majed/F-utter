import 'package:course_flutter_firebase/pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String language= SharedPrefController().getValueFor<String>(key:PrefKey.language.name) ?? "en";
  void changeLanguage(String language){
    this.language=language;
    SharedPrefController().setLanguage(language);
    notifyListeners();
  }

}