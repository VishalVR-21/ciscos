import 'package:ciscos/provider/product.dart';
import 'package:ciscos/screens/Adivisory.dart';
import 'package:ciscos/screens/Agriculture.dart';
import 'package:ciscos/screens/Shop.dart';
import 'package:ciscos/screens/Testimonial.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage_Tabbar extends StatefulWidget {
  const HomePage_Tabbar();

  @override
  State<HomePage_Tabbar> createState() => _HomePage_TabbarState();
}

class _HomePage_TabbarState extends State<HomePage_Tabbar> {
  int _selected = 0;

  List _pages = [
    ShopApp(),
    Advice(),
    Agriculture(),
    Testinomial(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
      if (index == 0) {
        //var prd = Provider.of<Product>(context);
        Product n;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            // bottomNavigationBar: TabBar(
            //   tabs: [
            //     Tab(icon: Icon(Icons.shop), text: "Products"),
            //     Tab(icon: Icon(Icons.person), text: "Advice"),
            //     Tab(
            //       icon: Icon(Icons.grass),
            //       text: "Plans",
            //     ),
            //     Tab(
            //       icon: Icon(Icons.video_call),
            //       text: "Testimonial",
            //     ),
            //   ],
            // ),
            // body: TabBarView(children: [
            //   ShopApp(),
            //   Advice(),
            //   Agriculture(),
            //   Testinomial(),
            // ]),

            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.green,
              currentIndex: _selected,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Colors.green,
                    icon: Icon(Icons.shopping_bag),
                    label: 'Shop'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Advice'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.grass), label: 'Plans'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.video_call), label: 'Testimonial'),
              ],
            ),
            body: Center(child: _pages[_selected]),
          ),
        ));
  }
}
