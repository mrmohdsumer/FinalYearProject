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
        //  backgroundColor: const Color.fromARGB(255, 201, 19, 19),
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

Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
      Text(
  "Detection Tips",
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
SizedBox(height: 10),

Box(

points: Text.rich(
  TextSpan(
    style: TextStyle(fontSize: 16, color: Colors.black),
    children: [
      TextSpan(
        text: "Regular Monitoring: ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text:
            "Inspect grapevines frequently for any unusual spots or lesions.\n\n",

      ),

      TextSpan(
        text: "Visual Inspection: ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text:
            "Look for small, dark spots on leaves, stems, or fruit.\n\n",
      ),

      TextSpan(
        text: "Use Magnification Tools: ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text:
            "Use magnifying glasses to closely examine the spots.\n\n",
      ),

      TextSpan(
        text: "Identify Common Diseases: ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text:
            "Familiarize yourself with common grape diseases like powdery mildew and black rot.\n\n",
      ),

      TextSpan(
        text: "Environmental Awareness: ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text:
            "Note weather conditions like humidity and rainfall that may promote disease.\n\n",
      ),

      TextSpan(
        text: "Consult Experts: ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text:
            "Reach out to viticulture experts or plant pathologists for guidance.\n\n",
      ),

      TextSpan(
        text: "Preventive Measures: ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text:
            "Maintain vineyard sanitation and apply appropriate fungicides.",
      ),
    ],
  ),
),
                      color: Color.fromARGB(255, 239, 240, 241),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
//                   Box(
// points: Text(
// """Regularly inspect grapevines for any unusual spots or lesions.
// Look for small, dark spots on leaves, stems, or fruit.
// Use magnifying glasses to closely examine the spots.
// Familiarize yourself with common grape diseases like powdery mildew and black rot.
// Note weather conditions like humidity and rainfall that may promote disease.
// Reach out to viticulture experts or plant pathologists for guidance.
// Maintain vineyard sanitation and apply appropriate fungicides.""",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       color: Color(0xff7ba0ef),
//                     ),



    Text(
  "Detection Tips",
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
SizedBox(height: 10),


    // 🔹 Detection Tips
    Box(
      points: Text.rich(
        TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [

            TextSpan(
              text: "Regular Inspection: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Inspect leaves, stems, and fruits for unusual spots or discoloration.\n\n",
            ),

            TextSpan(
              text: "Early Symptoms: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Look for yellowing, curling, or powdery patches.\n\n",
            ),

            TextSpan(
              text: "Leaf Checking: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Check both upper and lower surfaces of leaves.\n\n",
            ),

            TextSpan(
              text: "Proper Observation: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Use good lighting or magnification tools.\n\n",
            ),

            TextSpan(
              text: "Track Changes: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Monitor changes over time for early detection.",
            ),
          ],
        ),
      ),
      color: Color(0xffADD8E6),
    ),

    SizedBox(height: 20),

    Text(
      "Prevention Tips",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 10),

    // 🔹 Prevention Tips
    Box(
      points: Text.rich(
        TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [

            TextSpan(
              text: "Plant Spacing: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Ensure proper spacing for better air circulation.\n\n",
            ),

            TextSpan(
              text: "Water Control: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Avoid overwatering and maintain balanced moisture.\n\n",
            ),

            TextSpan(
              text: "Resistant Varieties: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Use disease-resistant plants whenever possible.\n\n",
            ),

            TextSpan(
              text: "Clean Environment: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Remove plant debris and keep the area clean.\n\n",
            ),

            TextSpan(
              text: "Preventive Sprays: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Use neem oil or bio-fungicides regularly.",
            ),
          ],
        ),
      ),
      color: Color(0xff7ba0ef),
    ),

    SizedBox(height: 20),


    Text(
      "Treatment Tips",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 10),
    // 🔹 Treatment Tips
    Box(
      points: Text.rich(
        TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [

            TextSpan(
              text: "Correct Identification: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Identify the disease before treatment.\n\n",
            ),

            TextSpan(
              text: "Use Proper Chemicals: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Apply recommended fungicides or pesticides.\n\n",
            ),

            TextSpan(
              text: "Remove Infection: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Cut and remove heavily infected parts.\n\n",
            ),

            TextSpan(
              text: "Correct Dosage: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Follow proper dosage and timing.\n\n",
            ),

            TextSpan(
              text: "Expert Advice: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  "Consult experts if disease spreads quickly.",
            ),
          ],
        ),
      ),
      color: Color.fromARGB(255, 166, 204, 166),
    ),

    SizedBox(height: 20),
  ],
)
// Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [

//     // 🔹 Detection Tips
//     Text(
//       "Detection Tips",
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     ),
//     SizedBox(height: 10),

//     Box(
//       points: Text(
//         """Regularly inspect leaves, stems, and fruits for unusual spots or discoloration.
// Look for early symptoms like yellowing, curling, or powdery patches.
// Check both upper and lower surfaces of leaves.
// Use proper lighting or magnification tools for accurate observation.
// Monitor changes over time to detect disease progression early.""",
//         textAlign: TextAlign.left,
//         style: TextStyle(fontSize: 16),
//       ),
//       color: Color(0xffADD8E6),
//     ),

//     SizedBox(height: 20),

//     // 🔹 Prevention Tips
//     Text(
//       "Prevention Tips",
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     ),
//     SizedBox(height: 10),

//     Box(
//       points: Text(
//         """Ensure proper spacing between plants to improve air circulation.
// Avoid overwatering and maintain balanced soil moisture.
// Use disease-resistant plant varieties whenever possible.
// Keep the farming area clean and remove plant debris regularly.
// Apply preventive organic sprays such as neem oil or bio-fungicides.""",
//         textAlign: TextAlign.left,
//         style: TextStyle(fontSize: 16),
//       ),
//       color: Color(0xff7ba0ef),
//     ),

//     SizedBox(height: 20),

//     // 🔹 Treatment Tips
//     Text(
//       "Treatment Tips",
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     ),
//     SizedBox(height: 10),

//     Box(
//       points: Text(
//         """Identify the disease correctly before applying any treatment.
// Use recommended fungicides or pesticides based on the disease type.
// Remove severely infected plant parts to stop spread.
// Follow proper dosage and timing when applying chemicals.
// Consult agricultural experts if the disease spreads rapidly.""",
//         textAlign: TextAlign.left,
//         style: TextStyle(fontSize: 16),
//       ),
//       color: Color(0xff90ee90),
//     ),

//     SizedBox(height: 20),
//   ],
// )
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
  const Box({
    Key? key,
    required this.points,
    required this.color,
  }) : super(key: key);

  final Widget points;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.85,
      margin: const EdgeInsets.symmetric(vertical: 8), // spacing between boxes
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20)),

        // ✅ SHADOW ADDED HERE
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4), // shadow direction
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: points,
        ),
      ),
    );
  }
}

// class Box extends StatelessWidget {
//   //box class to create a container with some text on it.
//   const Box({
//     Key? key,
//     required this.points,
//     required this.color,
//   }) : super(key: key);

//   final Widget points;
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.35,
//       width: MediaQuery.of(context).size.width * 0.8,
//       // color: col,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(37)),
//         color: color,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: points,
//         ),
//       ),
//     );
//   }
// }
