import 'package:course_flutter_data_app/controllers/notes_db_controller.dart';
import 'package:course_flutter_data_app/models/note.dart';
import 'package:course_flutter_data_app/models/process_respones.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteGetXController extends GetxController {
  RxList<Note> notes = <Note>[].obs;
  RxBool loading=false.obs;
  static NoteGetXController get to => Get.find<NoteGetXController>();

  @override
  void onInit() {
    read();
    super.onInit();
  }

  final NotesDBController _notesDBController = NotesDBController();

  //CRUD

  Future<ProcessResponse> create(Note note) async {
    int newRowId = await _notesDBController.create(note);
    if (newRowId != 0) {
      note.id = newRowId;
      notes.add(note);
      // update();

    }
    return ProcessResponse(
        newRowId != 0 ? "Operation Completed" : "Operation Failed!",
        newRowId != 0);
  }

  void read() async {
    loading.value=true;
    notes.value = await _notesDBController.read();
    loading.value=false;
    // update();
  }

  Future<ProcessResponse> updateNote(Note note) async {
    bool updated = await _notesDBController.update(note);
    if (updated) {
      int index = notes.indexWhere((element) => element.id == note.id);
      if (index != -1) {
        notes[index] = note;
        // update();
      }
    }

    return ProcessResponse(
        updated ? "Updated successfully" : "Updated failed!", updated);
  }

  Future<ProcessResponse> delete(int index) async {
    bool deleted = await _notesDBController.delete(notes[index].id);
    if (deleted) {
      notes.removeAt(index);
      // update();
    }
    return ProcessResponse(
        deleted ? "Deleted successfully" : "Deleted failed!", deleted);
  }
}
