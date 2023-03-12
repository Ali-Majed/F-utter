import 'package:course_flutter_data_app/database/db_controller.dart';
import 'package:course_flutter_data_app/database/db_operations.dart';
import 'package:course_flutter_data_app/models/note.dart';
import 'package:sqflite/sqflite.dart';

class NotesDBController extends DbOperations<Note>{

  Database database=DBController().database;


  @override
  Future<int> create(Note model) async{
    return await database.insert(Note.tableName, model.toMap());

  }

  @override
  Future<bool> delete(int id) async{
    // int countOfDeletedRows=await database.delete(Note.tableName,where: "id=? AND name = ?",whereArgs: [id]);
    int countOfDeletedRows =
    await database.delete(Note.tableName, where: "id = ?", whereArgs: [id]);
    return countOfDeletedRows == 1;
  }

  @override
  Future<List<Note>> read() async{

    List<Map<String,dynamic>> rows =await database.query(Note.tableName);
    return rows.map((rowMap) => Note.fromMap(rowMap)).toList();


  }

  @override
  Future<Note?> show(int id) async{

    List<Map<String,dynamic>> rows =
    await database.rawQuery("SELECT * FROM notes WHERE id = ?",[id]);
    return rows.isNotEmpty?Note.fromMap(rows.first):null;


  }

  @override
  Future<bool> update(Note model) async{
    int countOfUpdateRows = await database.update(
      Note.tableName,model.toMap(),
      where: 'id =?',whereArgs: [model.id]);
    return countOfUpdateRows ==1;
  }
}