// ignore: file_names
import 'package:flutter/material.dart';
import 'package:grapes_lesions_detection/widget/grapes_recogniser.dart';
import 'package:grapes_lesions_detection/navigationDrawer/navigatorDrawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routName = '/homepage';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Grapes Disease Detection"),
        ),
        body: const GrapesRecogniser(),
        drawer: const NavigatorDrawer(),
      ),
    );
  }
}

//---------------------------------------------------------------------

