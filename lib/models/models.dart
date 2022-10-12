import 'package:flutter/material.dart';

class Products {
  String id = "";
  String name = "";
  String des = "";
  double price = 0.0;
  String imageurl = "";

  Products(
      {required this.des,
      required this.id,
      required this.imageurl,
      required this.name,
      required this.price});
}
