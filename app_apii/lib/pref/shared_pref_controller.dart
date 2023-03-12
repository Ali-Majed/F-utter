import 'package:app_apii/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey{loggedIn, id, fullName, email, gender, token,language}
class SharedPrefController{

  late  SharedPreferences _sharedPreferences ;
   static SharedPrefController? _instance ;

   SharedPrefController._();


   factory SharedPrefController(){
     return _instance ??= SharedPrefController._();
   }

   Future<void> initPreferences() async {
     _sharedPreferences = await SharedPreferences.getInstance();
   }

   SharedPreferences get preferences => _sharedPreferences;

  Future<bool> setLanguage(String language) async {
    return _sharedPreferences.setString(PrefKey.language.name, language);
  }
   Future<void> save(Student student) async {

     await _sharedPreferences.setBool(PrefKey.loggedIn.name, true);
     await _sharedPreferences.setString(PrefKey.fullName.name, student.fullName);
     await _sharedPreferences.setInt(PrefKey.id.name, student.id);
     await _sharedPreferences.setString(PrefKey.email.name, student.email);
     await _sharedPreferences.setString(PrefKey.gender.name, student.gender);
     await _sharedPreferences.setString(PrefKey.token.name, "Bearer ${student.token}");

   }
   T? getValueFor<T>({required String key}){
     if(_sharedPreferences.containsKey(key)){
       return _sharedPreferences.get(key) as T?;
     }
     return null ;
   }

   Future<bool> clear() async {
     return await _sharedPreferences.clear();
   }
}