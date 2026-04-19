// // ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers
// //
// import 'package:flutter/material.dart';
// // ignore: unused_import
// import '../../routes/pageRoute.dart';
// import 'auth.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool _isObscure = true;
//   // bool _isVisible = false;
  
//   void _showErrorDialog() {
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
//   final auth = Authentication();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//     body: Stack(
//     fit: StackFit.expand, // Ensure the stack covers the entire screen
//     children: <Widget>[
//     // Background image
//     Positioned.fill(
//     child: Image.asset(
//     'assets/images/logen.jpg', // Path to your image asset
//     fit: BoxFit.cover,
//     ),
//     ),
//           // Your scrollable content
//           SingleChildScrollView(
//             reverse: true,
//             // padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 const SizedBox(
//                   height: 80,
//                   width: 200,
//                 ),
//                 // Login text Widget
//                 Center(
//                   child: Container(
//                     height: 200,
//                     width: 400,
//                     alignment: Alignment.center,
//                     child: const Text(
//                       "Signin Page",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 34,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 60,
//                   width: 20,
//                 ),
//                 // Wrong Password text
//                 // Visibility(
//                 //   visible: _isVisible,
//                 //   maintainSize: true,
//                 //   maintainAnimation: true,
//                 //   maintainState: true,
//                 //   child: Container(
//                 //     alignment: Alignment.centerLeft,
//                 //     padding: const EdgeInsets.all(10),
//                 //     child: const Text(
//                 //       "Wrong username or password or both entered",
//                 //       style: TextStyle(
//                 //         color: Colors.red,
//                 //         fontSize: 10,
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 // Textfields for username and password fields
//                 Container(
//                   height: 150,
//                   width: 530,
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       color: Colors.grey),
//                   child: Column(
//                     children: <Widget>[
//                       TextFormField(
//                         onTap: () {
//                           setState(() {
//                             // _isVisible = false;
//                           });
//                         },
//                         controller: usernameController, // Controller for Username
//                         decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "UserName",
//                             contentPadding: EdgeInsets.all(20)),
//                         onEditingComplete: () =>
//                             FocusScope.of(context).nextFocus(),
//                       ),
//                       const Divider(
//                         thickness: 3,
//                       ),
//                       TextFormField(
//                         onTap: () {
//                           setState(() {
//                             // _isVisible = false;
//                           });
//                         },
//                         controller: passwordController, // Controller for Password
//                         decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Password",
//                             contentPadding: const EdgeInsets.all(20),
//                             // Adding the visibility icon to toggle visibility of the password field
//                             suffixIcon: IconButton(
//                               icon: Icon(_isObscure
//                                   ? Icons.visibility_off
//                                   : Icons.visibility),
//                               onPressed: () {
//                                 setState(() {
//                                   _isObscure = !_isObscure;
//                                 });
//                               },
//                             )),
//                         obscureText: _isObscure,
//                       ),
//                     ],
//                   ),
//                 ),
//                 // this is Submit Button which is located on main login page
//                 Container(
//                   width: 570,
//                   height: 70,
//                   padding: const EdgeInsets.only(top: 20),
//                   child: ElevatedButton(
//                       child: const Text("Login",
//                           style: TextStyle(
//                             color: Color.fromRGBO(40, 38, 56, 1),
//                           )),
//                       onPressed: () {
//                         final username = usernameController.text.trim();
//                         final password = passwordController.text.trim();
//                         if (auth.fetchCredentials(username, password)) {
//                           Navigator.pushReplacementNamed(
//                               context, PageRoutes.home);
//                         } else {
//                           setState(() {
//                             // _isVisible = true;
//                              _showErrorDialog();
//                           });
//                         }
//                       }),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }