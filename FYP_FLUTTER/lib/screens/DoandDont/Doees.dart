//done with do's and don't not finalized the dimensions
import 'package:flutter/material.dart';
import 'package:grapes_lesions_detection/navigationDrawer/navigatorDrawer.dart';

class Dos extends StatelessWidget {
  const Dos({Key? key}) : super(key: key);

  static const String routeName = '/dodontpage';

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Care Unit"),
        ),
        body: SingleChildScrollView(
          child: Material(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // const Text(
                    //   "Do's and Don't",
                    //   style:
                    //       TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Box(
                      points: Text(
                        """Regular Monitoring: Inspect grapevines frequently for any unusual spots or lesions.
                        Visual Inspection: Look for small, dark spots on leaves, stems, or fruit.
                      Use Magnification Tools: Use magnifying glasses to closely examine the spots.
                      Identify Common Diseases: Familiarize yourself with common grape diseases like powdery mildew and black rot.
                      Environmental Awareness: Note weather conditions like humidity and rainfall that may promote disease.
                      Consult Experts: Reach out to viticulture experts or plant pathologists for guidance.
                        Preventive Measures: Maintain vineyard sanitation and apply appropriate fungicides.""",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      color: Color(0xffADD8E6),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Box(
                      points: Text(
                        """Regularly inspect grapevines for any unusual spots or lesions.
                        Look for small, dark spots on leaves, stems, or fruit.
                      Use magnifying glasses to closely examine the spots.
                        Familiarize yourself with common grape diseases like powdery mildew and black rot.
                      Note weather conditions like humidity and rainfall that may promote disease.
                      Reach out to viticulture experts or plant pathologists for guidance.
                      Maintain vineyard sanitation and apply appropriate fungicides.""",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      color: Color(0xff7ba0ef),
                    ),
                  ]),
            ),
          ),
        ),
        drawer: const NavigatorDrawer(),
      ),
    );
  }
}

class Box extends StatelessWidget {
  //box class to create a container with some text on it.
  const Box({
    Key? key,
    required this.points,
    required this.color,
  }) : super(key: key);

  final Text points;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.8,
      // color: col,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(37)),
        color: color,
      ),
      child: Container(
          padding: const EdgeInsets.all(12), child: Center(child: points)),
    );
  }
}
