import 'package:flutter/material.dart';
import 'package:grapes_lesions_detection/navigationDrawer/navigatorDrawer.dart';
import 'package:grapes_lesions_detection/screens/AboutDiseases/Blackrot.dart';
import 'package:grapes_lesions_detection/screens/AboutDiseases/DownyMeldew.dart';
import 'package:grapes_lesions_detection/screens/AboutDiseases/ESCA.dart';
import 'package:grapes_lesions_detection/screens/AboutDiseases/greymold.dart';
import 'package:grapes_lesions_detection/screens/AboutDiseases/Leafblight.dart';

class AboutDisease extends StatefulWidget {
  const AboutDisease({Key? key}) : super(key: key);

  static const String routeName = '/aboutdisease';
  @override
  State<AboutDisease> createState() => _AboutDiseaseState();
}

class _AboutDiseaseState extends State<AboutDisease> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("About Diseases")),
        body: SingleChildScrollView(
          child: Material(
            child: Column(children: [
              ListTile(
                leading: const Icon(Icons.assignment_rounded),
                title: const Text("Blackrot"),
                subtitle:
                    const Text("Black rot is caused by bacteria...."),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Eczema())),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: const Icon(Icons.assignment_rounded),
                title: const Text("ESCA"),
                subtitle: const Text("ESCA, a complex and chronic disease of ....."),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Chickenpox())),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: const Icon(Icons.assignment_rounded),
                title: const Text("Downy mildew"),
                subtitle: const Text("Downy mildew in grapes, caused by the pathogen  ....."),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Melanoma())),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: const Icon(Icons.assignment_rounded),
                title: const Text("Gray mold"),
                subtitle: const Text("Gray mold, also known as Botrytis ....."),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Psoriasis())),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: const Icon(Icons.assignment_rounded),
                title: const Text("Leaf Blight"),
                subtitle:
                    const Text("Leaf blight in grapes, often caused by fungi....."),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Marburg())),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ]),
          ),
        ),
        drawer: const NavigatorDrawer(),
      ),
    );
  }
}
