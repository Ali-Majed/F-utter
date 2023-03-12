import 'package:course_flutter_data_app/controllers/notes_db_controller.dart';
import 'package:course_flutter_data_app/models/note.dart';
import 'package:course_flutter_data_app/models/process_respones.dart';
import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  List<Note> notes = <Note>[];

  final NotesDBController _notesDBController = NotesDBController();

  //CRUD

  Future<ProcessResponse> create(Note note) async {
    int newRowId = await _notesDBController.create(note);
    if (newRowId != 0) {
      note.id = newRowId;
      notes.add(note);
      notifyListeners();
    }
    return ProcessResponse(
        newRowId != 0 ? "Operation Completed" : "Operation Failed!",
        newRowId != 0);
  }

  void read() async {
    notes = await _notesDBController.read();
    notifyListeners();
  }

  Future<ProcessResponse> updateNote(Note note) async {
    bool updated = await _notesDBController.update(note);
    if (updated) {
      int index = notes.indexWhere((element) => element.id == note.id);
      if (index != -1) {
        notes[index] = note;
        notifyListeners();
      }
    }

    return ProcessResponse(
        updated ? "Updated successfully" : "Updated failed!", updated);
  }

  Future<ProcessResponse> delete(int index) async {
    bool deleted = await _notesDBController.delete(notes[index].id);
    if (deleted) {
      notes.removeAt(index);
      notifyListeners();
    }
    return ProcessResponse(
        deleted ? "Deleted successfully" : "Deleted failed!", deleted);
  }
}
