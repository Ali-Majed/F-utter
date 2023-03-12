import 'package:course_flutter_firebase/models/firebase_respones.dart';

class BaseController{

  FirebaseResponse getResponse(String message,[bool success=true]){

    return FirebaseResponse(message,success);
  }
}