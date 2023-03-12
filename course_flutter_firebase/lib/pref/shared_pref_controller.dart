import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey{language}
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