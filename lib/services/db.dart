import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DbUtils {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getData(
    String collectionName,
  ) async =>
      await _db.collection(collectionName).get().then(
        (event) {
          return event.docs;
        },
      );

  static Future<void> addData(
    String collectionName,
    Map<String, dynamic> data,
  ) async =>
      await _db.collection(collectionName).add(data);

  static Future<void> deleteData(
    String collectionName,
    String documentId,
  ) async =>
      await _db.collection(collectionName).doc(documentId).delete();

  static Future<void> addUser(UserCredential userCredential) async {
    try {
      Map<String, dynamic> userData = {
        "uid": userCredential.user!.uid,
        "email": userCredential.user!.email,
        "expenses": {},
        "cards": {},
      };
      _db.collection("Users").add(userData);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  static Future<User> getUser(String uid) async {
    DocumentSnapshot documentSnapshot =
        await _db.collection("Users").doc(uid).get();
    if (documentSnapshot.exists) {
      User user = documentSnapshot.get(uid);
      return user;
    } else {
      throw Exception("User not found!");
    }
  }

  static Future<void> addExpense(
      User user, Map<String, dynamic> expenseData) async {
    await _db
        .collection("Users")
        .doc(user.uid)
        .collection("expenses")
        .add(expenseData);
  }
}
