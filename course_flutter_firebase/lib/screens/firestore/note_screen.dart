import 'package:course_flutter_firebase/firebase/fb_firestore_controller.dart';
import 'package:course_flutter_firebase/models/firebase_respones.dart';
import 'package:course_flutter_firebase/models/note.dart';
import 'package:course_flutter_firebase/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key, this.note}) : super(key: key);

  final Note? note;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late TextEditingController _titleTextController;
  late TextEditingController _infoTextController;

  @override
  void initState() {
    super.initState();
    _titleTextController = TextEditingController(text: widget.note?.title);
    _infoTextController = TextEditingController(text: widget.note?.info);
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _infoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            Text(context.localizations.enter_data,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Colors.black54)),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _titleTextController,
              keyboardType: TextInputType.text,
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                  hintText: context.localizations.title, prefixIcon: Icon(Icons.title)),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _infoTextController,
              keyboardType: TextInputType.text,
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                  hintText: context.localizations.info, prefixIcon: Icon(Icons.info)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => _performSave(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff870160),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(context.localizations.save),
            ),
          ],
        ),
      ),
    );
  }

  String get title => isNewNote ? context.localizations.create_note : context.localizations.update_note;

  bool get isNewNote => widget.note == null;

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
    context.showSnackBar(message: 'Enter required data !', error: true);
    return false;
  }

  void _save() async {
    FirebaseResponse response = isNewNote
        ? await FbFireStoreController().createNote(note)
        : await FbFireStoreController().update(note);

    context.showSnackBar(message: response.message, error: !response.success);
    if (response.success) {
      isNewNote ? _clear() : Navigator.pop(context);
    }
  }

  Note get note {
    Note note = isNewNote ? Note() : widget.note!;
    note.title = _titleTextController.text;
    note.info = _infoTextController.text;
    return note;
  }

  void _clear() {
    _titleTextController.clear();
    _infoTextController.clear();
  }
}
