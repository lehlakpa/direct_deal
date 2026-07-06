import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String phone;
  final int age;
  final String gender;
  final int failedAttempts;
  final bool disabled;
  final Timestamp? blockedUntil;

  UserModel({
    required this.uid,
    required this.email,
    required this.phone,
    required this.age,
    required this.gender,
    required this.failedAttempts,
    required this.disabled,
    this.blockedUntil,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "phone": phone,
      "age": age,
      "gender": gender,
      "failedAttempts": failedAttempts,
      "disabled": disabled,
      "blockedUntil": blockedUntil,
      "createdAt": FieldValue.serverTimestamp(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map["uid"] ?? "",
      email: map["email"] ?? "",
      phone: map["phone"] ?? "",
      age: map["age"] ?? 0,
      gender: map["gender"] ?? "",
      failedAttempts: map["failedAttempts"] ?? 0,
      disabled: map["disabled"] ?? false,
      blockedUntil: map["blockedUntil"],
    );
  }
}
