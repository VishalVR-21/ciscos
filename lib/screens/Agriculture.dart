import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Theme.dart' as Themes;

class Agriculture extends StatelessWidget {
  Agriculture();

  List<String> objects = [
    ///"Govenement schemes",
    "Pure farming",
    "Impure farming",
    "Inorganic farming",
    "Marketing",
  ];

//   List<String> a = ["Organic Products:
// "Soil organic matter is the fraction of the soil that consist of plant or animal tissue in various stages as decomposition .Most of our productive agricultural soils have between 3 and 6% organic matter.",
// Organic matter is made up of:
// 1) Plant residues and living microbial biomass.
// 2) Active soil organic matter also referred to as detritus.
// 3) Stable soil organic matter, often referred to as humus.
// The living microbial biomass includes the micro-organisms responsible for decomposition of both plant residuces and
// active stable fraction of the soil organic matter that is formed from decomposed plant and animal tissue .
// Physical Benefits: • Enhances aggregate stability, improving water infiltration and soil aeration, reducing runoff. • Improve water infiltration and soil aeration, reducing runoff. • Reduces the stickiness of clay soil making then easier to fill. • Reduces surface crusting, facilitating seedbed preparation.
// Chemical Benefits: • Increase the soil’s CEC or its ability to hold onto and supply over time essential nutrients such as calcium, magnesium and potassium . • Improves the ability of a soil to resist pH changes. • Accelerates decomposition of soil mineral over time making the nutrients in the minerals available for plant uptake.
// Biological Benefits: • Provide food for the living organisms in the soil . • Enhances soil microbial biodiversity and activity with can help in the suppression of diseases and pests. • Enhances pore space through the actions of soil micro-organisms . This helps to increase infiltration and reduce runoff."];

  List<FaIcon> images = [
    //  FaIcon(FontAwesomeIcons.university),
    FaIcon(FontAwesomeIcons.tree),
    FaIcon(FontAwesomeIcons.tractor),
    FaIcon(FontAwesomeIcons.tractor),
    FaIcon(FontAwesomeIcons.chartLine)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        pinned: true,
        snap: true,
        floating: true,
        expandedHeight: 160,
        iconTheme: IconThemeData(color: Colors.purple),
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            'Resources',
            style: TextStyle(
                color: Colors.teal,
                fontFamily: GoogleFonts.playball().fontFamily,
                fontSize: 30),
          ),
          centerTitle: true,
          background: Image.asset(
            'assets/inorganic.jpeg',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      SliverFillRemaining(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                border: Border.all(color: Colors.teal, width: 5.0)),
            child: ListView.builder(
                itemBuilder: ((context, index) => Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.teal,
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Container(child: images[index]),
                        title: Text(objects[index]),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    )),
                itemCount: objects.length)),
      )
    ]));
  }
}
