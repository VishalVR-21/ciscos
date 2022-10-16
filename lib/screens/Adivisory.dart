import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../provider/advisor.dart';

class Advice extends StatelessWidget {
  Advice();

  List<Expert> expert = [
    Expert(name: "Person 1", details: "Deatails 1", number: 123456678),
    Expert(name: "Person 2", details: "Deatails 2", number: 123456678),
    Expert(name: "Person 3", details: "Deatails 3", number: 123456678),
    Expert(name: "Person 4", details: "Deatails 4", number: 123456678),
    Expert(name: "Person 5", details: "Deatails 5", number: 123456678)
  ];

  // FirebaseFirestore data =  FirebaseFirestore.instance.collection('product').get()

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("Adivesory"),
          ),
          body: Container(
            child: ListView.builder(
                itemCount: expert.length,
                itemBuilder: ((context, index) => GestureDetector(
                      onTap: () {
                        int num = expert[index].number;
                        String number = "tel://$num";
                        launchUrlString(number);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: CircleAvatar(),
                          title: Text(expert[index].name),
                          subtitle: Text(expert[index].details),
                          trailing: Text(expert[index].number.toString()),
                        ),
                      ),
                    ))),
          ),
        ));
  }
}
