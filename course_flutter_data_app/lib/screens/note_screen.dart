import 'package:course_flutter_data_app/get/note_getx_controller.dart';
import 'package:course_flutter_data_app/models/process_respones.dart';
import 'package:course_flutter_data_app/prefs/shared_pref_controller.dart';
import 'package:course_flutter_data_app/provider/note_provider.dart';
import 'package:course_flutter_data_app/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key, this.note}) : super(key: key);

  final Note? note;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  late TextEditingController _titleTextController;
  late TextEditingController _infoTextController;
  // NoteGetXController controller=Get.find<NoteGetXController>();

  @override
  void initState() {
    super.initState();
    _titleTextController = TextEditingController(text: widget.note?.title);
    _infoTextController = TextEditingController(text: widget.note?.info);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: _titleTextController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: context.localizations.title,
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _infoTextController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: context.localizations.info,
                prefixIcon: Icon(Icons.info),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _performSave(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(context.localizations.save),
            )
          ],
        ),
      ),
    );
  }

  bool get isNewNote => widget.note == null;

  String get title => isNewNote
      ? context.localizations.create_note
      : context.localizations.update_note;

  void _performSave() {
    if (_checkData()) {
      _save();
    }
  }

  bool _checkData() {
    if (_titleTextController.text.isNotEmpty &&
        _infoTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(context.localizations.error_data, true);
    return false;
  }

  void _save() async {
    ProcessResponse processResponse = isNewNote
        ? await NoteGetXController.to.create(note)
        : await NoteGetXController.to.updateNote(note);

    context.showSnackBar(processResponse.message, !processResponse.success);
    if (processResponse.success) {
      isNewNote ? clear() : Navigator.pop(context);
    }
  }

  void clear() {
    _titleTextController.clear();
    _infoTextController.clear();
  }

  Note get note {
    Note note = isNewNote ? Note() : widget.note!;
    note.title=_titleTextController.text;
    note.info=_infoTextController.text;
    note.userId=SharedPrefController().getValueFor<int>(PrefKeys.id.name)!;
    return note;
  }
}
