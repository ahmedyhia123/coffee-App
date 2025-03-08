import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Sign Up User and Store Data
  Future<UserCredential?> signUpUser(
      String email, String password, String name) async {
    try {
      // Create User
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user!.uid;

      await firestore.collection("users").doc(uid).set({
        "name": name,
        "email": email,
        "uid": uid,
      });

      print("User registered and data saved!");
      return userCredential;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
