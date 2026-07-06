import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // REGISTER
  static Future<String?> register({
    required String fullName,
    required String email,
    required String password,
    required String phone,
    required String dob,
    required String gender,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection("users").doc(credential.user!.uid).set({
        "uid": credential.user!.uid,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "dob": dob,
        "gender": gender,
        "failedAttempts": 0,
        "disabled": false,
        "blockedUntil": null,
        "createdAt": FieldValue.serverTimestamp(),
      });

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // LOGIN
  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      QuerySnapshot query = await _firestore
          .collection("users")
          .where("email", isEqualTo: email)
          .limit(1)
          .get();

      if (query.docs.isEmpty) {
        return "User not found";
      }

      DocumentSnapshot doc = query.docs.first;

      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      bool disabled = data["disabled"] ?? false;

      if (disabled) {
        return "Account disabled";
      }

      if (data["blockedUntil"] != null) {
        DateTime blockedUntil = (data["blockedUntil"] as Timestamp).toDate();

        if (DateTime.now().isBefore(blockedUntil)) {
          return "Account locked until $blockedUntil";
        }
      }

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      await _firestore.collection("users").doc(doc.id).update({
        "failedAttempts": 0,
        "blockedUntil": null,
      });

      return null;
    } on FirebaseAuthException catch (_) {
      QuerySnapshot query = await _firestore
          .collection("users")
          .where("email", isEqualTo: email)
          .limit(1)
          .get();

      if (query.docs.isEmpty) {
        return "Invalid credentials";
      }

      DocumentSnapshot doc = query.docs.first;

      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      int attempts = data["failedAttempts"] ?? 0;

      attempts++;

      // 3 attempts = 15 min lock
      if (attempts == 3) {
        await _firestore.collection("users").doc(doc.id).update({
          "failedAttempts": attempts,
          "blockedUntil": Timestamp.fromDate(
            DateTime.now().add(const Duration(minutes: 15)),
          ),
        });

        return "Too many attempts. Locked for 15 minutes.";
      }

      // 5 attempts = disable account
      if (attempts >= 5) {
        await _firestore.collection("users").doc(doc.id).update({
          "failedAttempts": attempts,
          "disabled": true,
        });

        return "Account disabled.";
      }

      await _firestore.collection("users").doc(doc.id).update({
        "failedAttempts": attempts,
      });

      return "Wrong password ($attempts/5)";
    } catch (e) {
      return e.toString();
    }
  }

  static Future<void> logout() async {
    await _auth.signOut();
  }
}
