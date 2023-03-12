import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_flutter_firebase/firebase/base_controller.dart';
import 'package:course_flutter_firebase/models/firebase_respones.dart';
import 'package:course_flutter_firebase/models/note.dart';

class FbFireStoreController extends BaseController {
  static FbFireStoreController? _instance;

  FbFireStoreController._();

  factory FbFireStoreController() {
    return _instance = FbFireStoreController._();
  }

  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  Future<FirebaseResponse> createNote(Note note) async {
    return _firebaseFireStore
        .collection("Notes")
        .add(note.toMap())
        .then((value) => getResponse("Creating Successfully"))
        .catchError((error) => getResponse("Creating Failed", false));
  }

  Stream<QuerySnapshot<Note>> read() async* {
    yield* _firebaseFireStore
        .collection('Notes')
        .withConverter<Note>(
            fromFirestore: (snapshot, options) =>
                Note.fromMap(snapshot.data()!),
            toFirestore: (value, options) => value.toMap())
        .snapshots();
  }

  Future<FirebaseResponse> update(Note note) async {
    return _firebaseFireStore
        .collection("Notes")
        .doc(note.id)
        .update(note.toMap())
        .then((value) => getResponse("Updating Successfully"))
        .catchError((error) => getResponse("Updating Failed", false));
  }

  Future<FirebaseResponse> delete(String id) async {
    return _firebaseFireStore
        .collection("Notes")
        .doc(id)
        .delete()
        .then((value) => getResponse("Deleting Successfully"))
        .catchError((error) => getResponse("Deleting Failed", false));
  }
}
