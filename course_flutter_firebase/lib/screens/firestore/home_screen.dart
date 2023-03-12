import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_flutter_firebase/firebase/fb_auth_controller.dart';
import 'package:course_flutter_firebase/firebase/fb_firestore_controller.dart';
import 'package:course_flutter_firebase/models/firebase_respones.dart';
import 'package:course_flutter_firebase/models/note.dart';
import 'package:course_flutter_firebase/screens/firestore/note_screen.dart';
import 'package:course_flutter_firebase/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Note>>(
          stream: FbFireStoreController().read(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: Icon(Icons.note_outlined),
                      title: Text(snapshot.data!.docs[index].data().title),
                      subtitle: Text(snapshot.data!.docs[index].data().info),
                      trailing: IconButton(
                          onPressed: () => _deleteNote(
                              context, snapshot.data!.docs[index].id),
                          icon: Icon(Icons.delete_outline)),
                      onTap: () {
                        QueryDocumentSnapshot<Note> documentSnapshot =
                            snapshot.data!.docs[index];
                        Note note = documentSnapshot.data()
                          ..id = documentSnapshot.id;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NoteScreen(
                                note: note,
                              ),
                            ));
                      },
                    );
                  }));
            } else {
              return Center(
                child: Text(
                  "No Notes",
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.note_add_outlined),
        backgroundColor: Color(0xff870160),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteScreen(),
                ));
          }

      ),
    );

  }

  void _deleteNote(BuildContext context, String id) async {
    FirebaseResponse response = await FbFireStoreController().delete(id);
    context.showSnackBar(message: response.message, error: !response.success);
  }
}
