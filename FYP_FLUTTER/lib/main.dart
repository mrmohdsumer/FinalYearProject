import 'package:flutter/material.dart';
import 'package:grapes_lesions_detection/routes/pageRoute.dart';
import 'package:grapes_lesions_detection/screens/AboutDiseases/aboutdiseases.dart';
import 'package:grapes_lesions_detection/screens/Aboutus/aboutcreaters.dart';
import 'package:grapes_lesions_detection/screens/DoandDont/Doees.dart';
import 'package:grapes_lesions_detection/screens/Introduction/intro.dart';
import 'package:grapes_lesions_detection/screens/MainScreen/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grapes Lesion Detection',
      home: const Intro(),
      routes: {
        PageRoutes.home: (context) => const MainScreen(),
        PageRoutes.dodont: (context) => const Dos(),
        PageRoutes.intro: (context) => const Intro(),
        PageRoutes.aboutdis: (context) => const AboutDisease(),
        PageRoutes.aboutus: (context) => const AboutUs(),
      },
    );
  }
}

/*
Important link : https://www.thirdrocktechkno.com/blog/how-to-implement-navigation-drawer-in-flutter/

*/
