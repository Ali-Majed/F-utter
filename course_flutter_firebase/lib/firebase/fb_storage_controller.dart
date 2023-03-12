import 'dart:io';

import 'package:course_flutter_firebase/firebase/base_controller.dart';
import 'package:course_flutter_firebase/models/firebase_respones.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FbStorageController extends BaseController {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<TaskSnapshot> upload(String path) async {
    return _storage
        .ref("images/image_${DateTime.now().millisecondsSinceEpoch}")
        .putFile(File(path));
  }

  Future<List<Reference>> read() async {
    ListResult result = await _storage.ref("images").listAll();
    return result.items.isNotEmpty ? result.items : [];
  }

  Future<FirebaseResponse> delete(String path) async {
   return await _storage
        .ref(path)
        .delete()
        .then((value) => getResponse("Image deleted"))
        .catchError((error) => getResponse("Deleted Fai led!"));
  }
}
