import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser({
    required String uid,
    required String name,
    required int age,
    required String email,
  }) {
    return _db.collection("users").doc(uid).set({
      "name": name,
      "age": age,
      "email": email,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUser(String uid) {
    return _db.collection("users").doc(uid).snapshots();
  }
}