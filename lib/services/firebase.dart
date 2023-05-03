import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUtils {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getData(
    String collectionName,
  ) async =>
      await _db.collection(collectionName).get().then((event) {
        return event.docs;
      });

  static Future<List<Map<String, dynamic>>> getUsers() async {
    var users = await _db.collection("Users").get();
    return users.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> addUser(Map<String, dynamic> user) async {
    await _db.collection("users").add(user);
  }

  static Future<void> deleteUser(String userId) async {
    await _db.collection("users").doc(userId).delete();
  }

  static void addTestUser() {
    final testUser = <String, dynamic>{
      "displayname": "Test user",
      "email": "test@test.com",
      "password": "testpassword",
      "username": "testusername"
    };
    _db.collection("Users").add(testUser).then(
      (DocumentReference doc) {
        print("test user added with id: ${doc.id}");
      },
    );
  }
}
