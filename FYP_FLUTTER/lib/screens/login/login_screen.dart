// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import '../../routes/pageRoute.dart';
import 'auth.dart';
import 'dart:ui';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  final auth = Authentication();

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            "Login Failed",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            "Wrong username or password",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: [

          // 🔹 Background Image + Overlay
          Positioned.fill(
            child: 
            // Stack(
            //   children: [
            //     Image.asset(
            //       'assets/images/logen.jpg',
            //       fit: BoxFit.cover,
            //     ),
            //     Container(
            //       color: Colors.black.withValues(alpha: 0.3),
            //     ),
            //   ],
            // ),

            Stack(
  children: [

    // ✅ FULL SCREEN IMAGE
    // Positioned.fill(
    //   child: Image.asset(
    //     'assets/images/logen.jpg',
    //     fit: BoxFit.cover,
    //   ),
      
    // ),

Positioned.fill(
  child: Stack(
    children: [
      Image.asset(
        'assets/images/logen.jpg',
        fit: BoxFit.cover,
      ),

      // ✅ BLUR EFFECT
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.black.withValues(alpha: 0.2),
        ),
      ),
    ],
  ),
),
    // ✅ DARK OVERLAY (optional but recommended)
    // Positioned.fill(
    //   child: Container(
    //     color: Colors.black.withValues(alpha: 0.3),
    //   ),
    // ),

    // ✅ CONTENT ON TOP
    SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // your login card here
          ],
        ),
      ),
    ),
  ],
)
          ),

          // 🔹 Login Card
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120),

                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.95),
                      borderRadius: BorderRadius.circular(20),

                      // ✅ Shadow
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        // 🔹 Title
                        const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // 🔹 Username
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: "Username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // 🔹 Password
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // 🔹 Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text("Login"),
                            onPressed: () {
                              final username =
                                  usernameController.text.trim();
                              final password =
                                  passwordController.text.trim();

                              if (auth.fetchCredentials(username, password)) {
                                Navigator.pushReplacementNamed(
                                    context, PageRoutes.home);
                              } else {
                                _showErrorDialog();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}