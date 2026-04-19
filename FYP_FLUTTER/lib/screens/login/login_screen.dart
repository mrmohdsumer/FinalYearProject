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

  // void _showErrorDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.white,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         title: const Text(
  //           "Login Failed",
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //         content: const Text(
  //           "Wrong username or password",
  //           style: TextStyle(fontSize: 16),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: const Text("OK"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void _showErrorDialog() {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.3), // optional dim background
    builder: (context) {
      return Align(
        alignment: Alignment.topCenter, // 🔥 MOVE TO TOP
        child: Padding(
          padding: const EdgeInsets.only(top: 180, left: 20, right: 20),
          child: Material(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Login Failed",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Wrong username or password",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 15),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/logen.jpg',
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withValues(alpha: 0.3),
            ),
          ),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  Center(
                    child: Container(
                      height: 380,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.95),
                        borderRadius: BorderRadius.circular(20),
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
                          const SizedBox(height: 25),
                          const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 12),
                              labelText: "Username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 45),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 12),
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
                          const SizedBox(height: 45),

// 🔹 Button with shadow + better color
Container(
  width: double.infinity,

  // ✅ ADD SHADOW HERE (not inside button)
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.25), // shadow color
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  ),

  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF3B82F6), // 🔵 nicer blue (not default)
      foregroundColor: Colors.white, // text color

      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

      elevation: 0, // ❗ important: remove default shadow
    ),

    onPressed: () {
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();

      if (auth.fetchCredentials(username, password)) {
        Navigator.pushReplacementNamed(
            context, PageRoutes.home);
      } else {
        _showErrorDialog();
      }
    },

    child: const Text(
      "Login",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
