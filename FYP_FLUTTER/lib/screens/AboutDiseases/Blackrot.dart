import 'package:flutter/material.dart';

class Eczema extends StatelessWidget {
  const Eczema({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Black Rot"),
        ),
        body: const SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: Image(image: AssetImage("assets/images/blackrot.png"))),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Grape black rot is a fungal disease caused by an ascomycetous fungus, Guignardia bidwellii,\n that attacks grape vines during hot and humid weather. “Grape black rot originated in eastern North America, but now occurs in portions of Europe, South America, and Asia.\n It can cause complete crop loss in warm, humid climates, but is virtually unknown in regions with arid summers.\n” The name comes from the black fringe that borders growing brown patches on the leaves. The disease also attacks other parts of the plant, “all green parts of the vine: the shoots, leaf and fruit stems, tendrils, and fruit. The most damaging effect is to the fruit”.",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Black Rot Symptoms",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Symptoms of black rot first appear as small yellow spots on leaves.\n Enlarged spots (lesions) have a dark brownish-red border with tan to dark brown centers (Figure 1). As the infection develops, tiny black dots appear in the lesion, usually in a ring pattern near the border of the lesion (Figure 1- inset).\n These dots are fungal structures (pycnidia), which contain thousands of spores (conidia) that can infect new tissue.\n New infections can occur in less than 10 hours at temperatures between 60 to 85 degrees Fahrenheit.\n",
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
