import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dummy extends StatefulWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  final databaseReference = FirebaseDatabase.instance.ref();

  void hello() async {
    Firebase.initializeApp();
    // var newval;
    // var data = await FirebaseDatabase.instance
    //     .ref('/user/furOEfMe4gwqX4MzK4nN/products');
    // print(data.child('products').get().then((value) => newval = value.exists));
    // print(newval);
    // print("hellos");
    void readData() {
      databaseReference.get().then((value) => print(value.value));
    }
  }

  void createData() {
    databaseReference
        .child("flutterDevsTeam1")
        .set({'name': 'Deepak Nishad', 'description': 'Team Lead'});
    databaseReference.child("flutterDevsTeam2").set(
        {'name': 'Yashwant Kumar', 'description': 'Senior Software Engineer'});
    databaseReference
        .child("flutterDevsTeam3")
        .set({'name': 'Akshay', 'description': 'Software Engineer'});
    databaseReference
        .child("flutterDevsTeam4")
        .set({'name': 'Aditya', 'description': 'Software Engineer'});
    databaseReference
        .child("flutterDevsTeam5")
        .set({'name': 'Shaiq', 'description': 'Associate Software Engineer'});
    databaseReference
        .child("flutterDevsTeam6")
        .set({'name': 'Mohit', 'description': 'Associate Software Engineer'});
    databaseReference
        .child("flutterDevsTeam7")
        .set({'name': 'Naveen', 'description': 'Associate Software Engineer'});
  }

  void readData() {
    databaseReference.once().then((snapshot) {
      print('Data : ${snapshot.previousChildKey}');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    hello();
    super.initState();
  }

  var datas = FirebaseDatabase.instance
      .ref('/user/furOEfMe4gwqX4MzK4nN/products/TRi5ebfFptKEfZLKF73Y');

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: TextButton(
                  onPressed: (() {
                    createData();
                    readData();
                  }),
                  child: Text('Hellos'))),
        ],
      ),
    );
  }
}
