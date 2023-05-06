// ignore_for_file: use_build_context_synchronously
import 'package:expenses_app/services/db.dart';
import 'package:expenses_app/widgets/alert/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signInWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      GoRouter.of(context).goNamed("home");
    } on FirebaseAuthException catch (error) {
      Alert.init(context);
      switch (error.code) {
        case "invalid-email":
          Alert.error("Invalid Email");
          break;
        case "user-not-found":
          Alert.error("User not found");
          break;
        case "wrong-password":
          Alert.error("Incorrect password");
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

  static Future<void> signOut(
    BuildContext context,
  ) async {
    try {
      _auth.signOut();
      GoRouter.of(context).goNamed("login");
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
    Alert.init(context);
    try {
      UserCredential userCredentials =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      DbUtils.addUser(userCredentials);
      Alert.success("User created $email");
    } on FirebaseAuthException catch (error) {
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
