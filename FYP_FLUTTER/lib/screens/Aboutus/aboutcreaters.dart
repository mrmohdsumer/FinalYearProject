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
        title: const Text("Project Team"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // 🔹 Supervisor Box
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Color(0xffE3F2FD), // light blue
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.school, size: 24, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          "Supervisor",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    // Text(
                    //   "Supervisor",
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    // ),
                    SizedBox(height: 10),
                    Text(
                      "Dr Adekanmi Adegun\nLecturer, Computer Science Department\nUniversity of Roehampton",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

              // 🔹 Developer Box
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xffE8F5E9), // light green
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Developer",
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    // ),

                    Row(
                      children: [
                        Icon(Icons.person, size: 24, color: Colors.green),
                        SizedBox(width: 8),
                        Text(
                          "Developer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Mohd Sumer\nID: A00021185",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //     child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: const [
      //     Padding(
      //       padding: EdgeInsets.only(top: 16, bottom: 5, left: 10),
      //       child: Text(
      //         "Supervisor Name",
      //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(left: 10),
      //       child: Text(
      //         "Dr Adekanmi Adegun:\nLecturer Computer Science Department University of Roehampton",
      //         style: TextStyle(fontSize: 20),
      //       ),
      //     ),

      //     Padding(
      //       padding: EdgeInsets.only(top: 16, bottom: 5, left: 10),
      //       child: Text(
      //         "Developer Name",
      //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(left: 10),
      //       child: Text(
      //         "Mohd Sumer \nID: A00021185",
      //         style: TextStyle(fontSize: 20),
      //       ),
      //     ),
      //   ],
      // )),
      drawer: const NavigatorDrawer(),
    ));
  }
}
