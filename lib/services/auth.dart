import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          break;
        case "user-not-found":
          break;
        case "wrong-password":
          break;
        default:
          // ignore: avoid_print
          print(error.code);
          return;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  static Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
