import 'package:cloud_firestore/cloud_firestore.dart';

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
    Map<String, dynamic> user,
  ) async =>
      await _db.collection(collectionName).add(user);

  static Future<void> deleteData(
    String collectionName,
    String documentId,
  ) async =>
      await _db.collection(collectionName).doc(documentId).delete();

  static Future<void> addTestUser() async {
    final testUser = <String, dynamic>{
      "displayname": "Test user",
      "email": "test@test.com",
      "password": "testpassword",
      "username": "testusername"
    };
    _db.collection("Users").add(testUser).then(
      (DocumentReference doc) {
        // ignore: avoid_print
        print("test user added with id: ${doc.id}");
      },
    );
  }
}
