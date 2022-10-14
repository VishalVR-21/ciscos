import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Theme.dart' as Themes;

class Agriculture extends StatelessWidget {
  Agriculture();

  List<String> objects = [
    "Govenement schemes",
    "Pure farming",
    "Impure farming",
    "Inorganic farming",
    "Marketing",
  ];

  List<FaIcon> images = [
    FaIcon(FontAwesomeIcons.university),
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
        backgroundColor: Colors.purple[300],
        iconTheme: IconThemeData(color: Colors.purple),
        flexibleSpace: FlexibleSpaceBar(
          title: Text('Flexible Appbar'),
          centerTitle: true,
          background: Image.asset(
            'assets/inorganic.jpeg',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      SliverFillRemaining(
        child: Container(
            child: ListView.builder(
                itemBuilder: ((context, index) => Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.green[200],
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
