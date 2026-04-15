// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grapes_lesions_detection/navigationDrawer/navigatorDrawer.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  static const String routeName = '/aboutcreators';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("About The Developers"),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16, left: 0),
            child: Text(
              "Supervisor Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text(
              "Irfanullah Khan:\n Lecturer Computer Science Department Iqra National University",
              style: TextStyle(fontSize: 20),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16, left: 0),
            child: Text(
              "Developer's Names",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text(
              "Muhammad Saqib (17877) & Asadullah Khan (17759)\n",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      )),
      drawer: const NavigatorDrawer(),
    ));
  }
}
