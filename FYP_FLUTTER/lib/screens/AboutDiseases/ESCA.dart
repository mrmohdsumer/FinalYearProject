import 'package:flutter/material.dart';

class Chickenpox extends StatelessWidget {
  const Chickenpox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ESCA"),
        ),
        body: const SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                child:
                    Image(image: AssetImage("assets/images/ESCA.png"))),
            Padding(
              padding: EdgeInsets.all(16),
child: Text(
"""ESCA, a complex and chronic disease of grapevines, is caused by a group of fungal pathogens, including Phaeomoniella chlamydospora and Phaeoacremonium aleophilum.
It affects the wood structure of vines, leading to black streaking in the vascular tissue and the formation of white rot. Symptoms include tiger-striped leaves, stunted growth, and eventual vine death.
The disease spreads through contaminated pruning tools and infected nursery stock. Management practices focus on preventive measures such as sanitizing tools, avoiding pruning during wet conditions, and removing and destroying infected vines. There are no effective chemical treatments, making vineyard hygiene and careful monitoring essential for controlling ESCA.
                """,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "ESCA Symptoms",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Padding(
                padding: EdgeInsets.all(16),
child: Text(
"""
Esca symptoms in grapevines can be categorized into foliar, wood, and fruit symptoms:

Tiger-Striping:
Leaves display interveinal chlorosis (yellowing) with green veins, creating a "tiger-stripe" pattern. Necrotic spots may form within the chlorotic areas, turning brown and brittle.

Leaf Burn:
Margins of leaves may show scorching or burn-like symptoms, eventually leading to leaf drop.

Black Streaking:
Dark streaks or black spots appear in the vascular tissues of the wood, often visible when the trunk or canes are cut.
White Rot:
Advanced infection leads to the formation of a soft, spongy white rot in the heartwood, compromising the vine's structural integrity.

Berry Discoloration:
Infected berries may show spots or discoloration. Berries may shrivel and fall off prematurely.
""",
style: TextStyle(fontSize: 18),
                )),
            // Padding(
            //     padding: EdgeInsets.all(16),
            //     child: Text(
            //       "What is the difference between smallpox and chickenpox?",
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //     )),
            // Padding(
            //     padding: EdgeInsets.all(16),
            //     child: Text(
            //       "Chickenpox and smallpox are both diseases that produce rashes on the skin, but they are different. For one thing, smallpox is a much more serious disease, causing severe illness and death. They are caused by different viruses. \n While the two diseases both produce rashes, the rashes themselves develop at different times and the rashes look different. Smallpox pustules look the same as each other, while the chickenpox rash develops in waves. The individual spots don’t look the same and some form scabs while others are still blistering. \n There’s another important difference. A massive global vaccination program has eradicated (wiped out) smallpox.",
            //       style: TextStyle(fontSize: 18),
            //     )),
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
