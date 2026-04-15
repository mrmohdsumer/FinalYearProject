import 'package:flutter/material.dart';

class Melanoma extends StatelessWidget {
  const Melanoma({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Downy Mildew"),
        ),
        body: const SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: Image(image: AssetImage("assets/images/Downymildew.jpeg"))),
            Padding(
              padding: EdgeInsets.all(16),
child: Text(
"""
Downy mildew in grapes, caused by the pathogen Plasmopara viticola, thrives in warm, humid conditions and can significantly impact grape yields. The disease spreads via wind-borne spores, which infect grapevine leaves, shoots, and berries, especially during wet weather. Management practices include ensuring good air circulation through proper pruning, removing infected plant debris, and applying fungicides. 
Resistant grape varieties and precise timing of chemical treatments based on weather forecasts also help control the disease.
Effective monitoring and integrated pest management are crucial for minimizing downy mildew's impact on grapevines.
""",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "DownyMildew Symptoms",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Padding(
              padding: EdgeInsets.all(16),
child: Text(
"""
Leaf Symptoms:
Oil Spots:
Yellowish, oily spots appear on the upper surface of leaves.
White Downy Growth:
On the undersides of leaves, a white, cotton-like growth is visible, especially in humid conditions.
Necrosis:
Advanced infection leads to brown or black necrotic patches.
Shoot and Tendril Symptoms:
Infected shoots and tendrils may show oily spots and white downy growth.
Young shoots may become stunted or distorted.
Fruit Symptoms:
Infected berries develop brown, shriveled spots.
Severe infections can lead to complete crop loss.
""",
style: TextStyle(fontSize: 18),
              ),
            ),
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
