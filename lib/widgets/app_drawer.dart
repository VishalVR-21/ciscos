import 'package:ciscos/widgets/changeusernae.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "../constans.dart";

import '/screens/orders_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  var name = FirebaseAuth.instance.currentUser.displayName;
  nameChange() {
    setState(() {
      name = FirebaseAuth.instance.currentUser.displayName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            //leadingWidth: 40.0,

            // title: Text(FirebaseAuth.instance.currentUser.displayName == Null
            //     ? "Name not present"
            //     : FirebaseAuth.instance.currentUser.displayName),
            automaticallyImplyLeading: false,
          ),
          Container(
            color: Colors.teal,
            child: Row(
              children: [
                Container(
                  //color: Colors.tea,
                  margin: EdgeInsets.all(10),
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      // size: double.nan,
                    ),
                    //maxRadius: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChangeName()));
                    nameChange();
                  },
                  child: Text(
                    name ?? "Name of the use",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.signOutAlt),
            title: Text('Sign Out'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
          // TextButton(
          //     onPressed: () {
          //       FirebaseAuth.instance.signOut();
          //     },
          //     child: Text('Sign Out'))
        ],
      ),
    );
  }
}
