import 'package:direct_deal/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'home_screens.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;
  bool obscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      loading = true;
    });

    String? result = await AuthService.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() {
      loading = false;
    });

    if (!mounted) return;

    if (result == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreens()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  const Icon(Icons.lock, size: 100, color: Colors.blue),

                  const SizedBox(height: 30),

                  CustomTextField(
                    controller: emailController,

                    hintText: "Email",

                    icon: Icons.email,

                    keyboardType: TextInputType.emailAddress,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email required";
                      }

                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Invalid email";
                      }

                      return null;
                    },
                  ),

                  CustomTextField(
                    controller: passwordController,

                    hintText: "Password",

                    icon: Icons.lock,

                    obscureText: obscure,

                    suffixIcon: IconButton(
                      icon: Icon(
                        obscure ? Icons.visibility : Icons.visibility_off,
                      ),

                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password required";
                      }

                      if (value.length < 6) {
                        return "Minimum 6 characters";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,

                    height: 50,

                    child: ElevatedButton(
                      onPressed: loading ? null : login,

                      child: loading
                          ? const CircularProgressIndicator()
                          : const Text("Login"),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    },

                    child: const Text("Create Account"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
