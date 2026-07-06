import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Dialog(
      alignment: Alignment.topRight,
      insetPadding: const EdgeInsets.only(top: 80, right: 20, left: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      backgroundColor: Colors.white,
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(20),
        child: user == null
            ? const Center(child: Text("Not logged in"))
            : FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection("users").doc(user.uid).get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 150,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) {
                    return const SizedBox(
                      height: 150,
                      child: Center(child: Text("Error loading profile")),
                    );
                  }

                  final userData = snapshot.data!.data() as Map<String, dynamic>;
                  final String fullName = userData['fullName'] ?? "Unknown User";
                  final String email = userData['email'] ?? user.email ?? "No Email";
                  final String dob = userData['dob'] ?? "N/A";
                  final String gender = userData['gender'] ?? "N/A";

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.blueAccent,
                        child: Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        fullName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        email,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "DOB: $dob",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Gender: $gender",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text("Logout", style: TextStyle(color: Colors.red)),
                        onTap: () async {
                          Navigator.pop(context);
                          await AuthService.logout();
                          if (context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => const LoginScreen()),
                              (route) => false,
                            );
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
