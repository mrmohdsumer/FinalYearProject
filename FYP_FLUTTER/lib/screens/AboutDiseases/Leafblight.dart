import 'package:flutter/material.dart';

class Marburg extends StatelessWidget {
  const Marburg({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Leaf Blight"),
        ),
        body: const SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                child:
                    Image(image: AssetImage("assets/images/Leafblight.png"))),
            Padding(
              padding: EdgeInsets.all(16),
child: Text(
"""
Leaf blight in grapes, often caused by fungi such as Pseudocercospora vitis or Alternaria, significantly impacts vine health and crop yields.
The disease thrives in warm, humid conditions, and spreads through wind, rain, and contaminated tools. Effective management involves regular vineyard monitoring, ensuring good air circulation through proper pruning, and removing and destroying infected leaves. Fungicide applications can help control the disease, especially during periods of high humidity. Using resistant grape varieties and maintaining overall vineyard hygiene are essential strategies for minimizing the effects of leaf blight.
""",
style: TextStyle(fontSize: 16),
),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Leaf Blight Symptoms",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(
"""
Leaf Symptoms:

Spots:
Small, water-soaked lesions appear on the leaves, which expand into larger, irregularly shaped necrotic spots.

Color Change:
These spots often turn brown or black and may have a yellow halo.

Blight:
Severe infections can cause large portions of the leaf to blight and die, leading to premature leaf drop.
Infected shoots and canes may develop dark lesions or streaks.
Advanced infections can lead to dieback of young shoots, reducing overall vine vigor.

Fruit Symptoms:
While primarily a foliar disease, severe infections can indirectly affect fruit by reducing the vine's overall health and photosynthetic capacity. In some cases, fruit near infected leaves may develop sunscald due to reduced canopy cover.
""",
style: TextStyle(fontSize: 16),
)),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
    ));
  }
}
