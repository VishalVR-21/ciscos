import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'product.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  String get name => null;

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product value) {
    _items.add(value);

    notifyListeners();
  }

  Future<List<Product>> getData() async {
    // QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
    //     .collection('user')
    //     .doc()
    //     .collection('products')
    //     .get();
    final userref = FirebaseFirestore.instance
        .collection('/user/furOEfMe4gwqX4MzK4nN/products');
    Product n;
    userref.get().then((value) {
      value.docs.forEach((element) {
        n = Product(
            id: element.data()['id'],
            title: element.data()['title'],
            description: element.data()['description'],
            price: element.data()['price'],
            imageUrl: element.data()['imageUrl']);
      });
      addProduct(n);
    });
    return [..._items];
    //return data;
  }

  List<Product> getDatas() {
    // QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
    //     .collection('user')
    //     .doc()
    //     .collection('products')
    //     .get();
    final userref = FirebaseFirestore.instance
        .collection('/user/furOEfMe4gwqX4MzK4nN/products');
    Product n;
    userref.get().then((value) {
      value.docs.forEach((element) {
        n = Product(
            id: element.data()['id'],
            title: element.data()['title'],
            description: element.data()['description'],
            price: element.data()['price'],
            imageUrl: element.data()['imageUrl']);
      });
    });
    items.add(n);
    return [..._items];
    //return [..._items];
    //return data;
  }

  Future<List<Product>> getUser() async {
    final userref = FirebaseFirestore.instance
        .collection('/user/furOEfMe4gwqX4MzK4nN/products');
    Product n;
    userref.get().then((value) {
      value.docs.forEach((element) {
        n = Product(
            id: element.data()['id'],
            title: element.data()['title'],
            description: element.data()['description'],
            price: element.data()['price'],
            imageUrl: element.data()['imageUrl']);
      });
      addProduct(n);
    });
    return [..._items];
  }
}
