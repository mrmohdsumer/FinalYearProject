import 'package:flutter/material.dart';

class Psoriasis extends StatelessWidget {
  const Psoriasis({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gray Mold"),
        ),
        body: const SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: Image(image: AssetImage("assets/images/greymold.jpeg"))),
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "What is Gray Mold",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Padding(
              padding: EdgeInsets.all(16),
child: Text(
"""
Gray mold, also known as Botrytis bunch rot, is a significant disease in grapes caused by the fungus Botrytis cinerea. It thrives in cool, humid conditions, particularly during the flowering and ripening stages. The disease spreads via wind, rain, insects, and human activity, infecting through wounds or natural openings in grape tissues.
Effective management includes improving air circulation through canopy management, removing infected plant material, and applying fungicides.
Utilizing resistant grape varieties and ensuring proper vineyard sanitation are also crucial in controlling gray mold and minimizing its impact on grape yields.
""",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Gray Mold Symptoms",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Padding(
                padding: EdgeInsets.all(16),
child: Text(
"""
Flower Symptoms:
Infected flowers may become brown and wither.Blossom blight can lead to poor fruit set.

Brown Spots: 
Small, water-soaked spots appear on the berries, which enlarge and become brown.

Grayish Mold:
A characteristic fuzzy gray mold forms on the surface of infected berries, especially under humid conditions.

Shriveling:
Infected berries may shrivel and dry up, resembling raisins.
Leakage:
Severely infected berries may burst and leak juice, further spreading the spores.
Leaf Symptoms:
Necrotic lesions may develop on leaves, though this is less common compared to fruit infections.
Shoot and Cane Symptoms:
Infections can cause dieback of young shoots and canes, leading to reduced vine vigor.
Cluster Symptoms:
Entire grape clusters can be affected, leading to significant crop loss. Infected clusters may have a brown, mushy appearance and are often covered in the gray mold.
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
