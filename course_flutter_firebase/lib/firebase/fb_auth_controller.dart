import 'package:course_flutter_firebase/models/firebase_respones.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FbAuthController {
  static FbAuthController? _instance;

  FbAuthController._();

  factory FbAuthController() {
    return _instance ??= FbAuthController._();
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseResponse> createAccount(
      {required String email,
      required String password,
      required String fullName}) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(fullName);
      await credential.user!.sendEmailVerification();
      await _firebaseAuth.signOut();
      return FirebaseResponse("Registered Successfully, Verify email ");
    } on FirebaseAuthException catch (e) {
      return FirebaseResponse(e.message ?? "", false);
    }
  }

  Future<FirebaseResponse> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      bool emailVerified = credential.user!.emailVerified;

      if (!emailVerified) _firebaseAuth.signOut();
      return FirebaseResponse(
          emailVerified
              ? "Logged in Successfully"
              : "Login rejected, verify email",
          emailVerified);
    } on FirebaseAuthException catch (e) {
      return FirebaseResponse(e.message ?? "", false);
    }
  }

  Future<FirebaseResponse> forgetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return FirebaseResponse("Password reset email sent");
    } on FirebaseAuthException catch (e) {
      return FirebaseResponse(e.message ?? "", false);
    }
  }

  Future<void> signOut() => _firebaseAuth.signOut();

  User get user => _firebaseAuth.currentUser!;

  bool get loggedIn => _firebaseAuth.currentUser != null;
}
