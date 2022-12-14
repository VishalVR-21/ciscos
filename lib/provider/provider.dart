import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class Product with ChangeNotifier {
  List<Products> _item = [
    Products(
      id: 'p1',
      name: 'Red Shirt',
      des: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageurl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Products(
      id: 'p2',
      name: 'Trousers',
      des: 'A nice pair of trousers.',
      price: 59.99,
      imageurl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Products(
      id: 'p3',
      name: 'Yellow Scarf',
      des: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageurl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Products(
      id: 'p4',
      name: 'A Pan',
      des: 'Prepare any meal you want.',
      price: 49.99,
      imageurl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  List<Products> item = [];

  List<Products> get items {
    return [..._item];
  }

  void addProduct() {
    //_item.add(value);
    notifyListeners();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('user')
        .doc()
        .collection('products')
        .get();
    return data;
  }
}
