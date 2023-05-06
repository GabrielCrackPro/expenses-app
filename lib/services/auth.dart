import 'package:expenses_app/widgets/alert/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signInWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      Alert.init(context);
      switch (error.code) {
        case "invalid-email":
          Alert.error("Invalid Email");
          break;
        case "user-not-found":
          break;
        case "wrong-password":
          break;
        default:
          Alert.error(error.code);
          return;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  static Future<void> createUserWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      Alert.init(context);
      switch (error.code) {
        case "invalid-email":
          Alert.error("Invalid email");
          break;
        case "email-already-in-use":
          Alert.error("Invalid email");
          break;
        case "weak-password":
          Alert.error("Choose a stronger password");
          break;
        default:
          Alert.error(error.code);
          break;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
