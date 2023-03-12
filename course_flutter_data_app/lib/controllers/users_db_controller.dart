import 'package:course_flutter_data_app/database/db_controller.dart';
import 'package:course_flutter_data_app/database/db_operations.dart';
import 'package:course_flutter_data_app/models/process_respones.dart';
import 'package:course_flutter_data_app/models/user.dart';
import 'package:course_flutter_data_app/prefs/shared_pref_controller.dart';
import 'package:sqflite/sqflite.dart';

class UserDBController{
  Database database=DBController().database;

  Future<ProcessResponse> login(String email, String password) async{
    List<Map<String,dynamic>> rows =await database.query(
        User.tableName, where: "email = ? AND password = ?",
        whereArgs: [email,password]);
    if(rows.isNotEmpty){
      User user = User.fromMap(rows.first);
      await SharedPrefController().save(user);
    }
    return ProcessResponse(rows.isNotEmpty
        ?"Logged in successfully"
        :"Login failed, check email & password"
    ,rows.isNotEmpty);
  }

  Future<ProcessResponse> register(User user) async{

    if(! await _isEmailExists(user.email)){
      int newRowId=await database.insert(User.tableName, user.toMap());
      return ProcessResponse("Registered successfully", newRowId != 0);

    }
    return ProcessResponse("Email exists, use another",false);
  }

  Future<bool> _isEmailExists(String email) async{
    List<Map<String,dynamic>> rows=await database.query(User.tableName, where:'email = ?', whereArgs:[email]);
    return rows.isNotEmpty;

  }

}