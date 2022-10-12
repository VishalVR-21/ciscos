import 'package:ciscos/screens/Adivisory.dart';
import 'package:ciscos/screens/Agriculture.dart';
import 'package:ciscos/screens/Products_overiview.dart';
import 'package:ciscos/screens/Testimonial.dart';
import 'package:flutter/material.dart';

class HomePage_Tabbar extends StatelessWidget {
  const HomePage_Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Tabs Demo'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.shop), text: "Products"),
              Tab(icon: Icon(Icons.person), text: "Advice"),
              Tab(
                icon: Icon(Icons.grass),
                text: "Plans",
              ),
              Tab(
                icon: Icon(Icons.video_call),
                text: "Testimonial",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Product_Screen(),
          Advice(),
          Agriculture(),
          Testinomial(),
        ]),
      ),
    ));
  }
}
