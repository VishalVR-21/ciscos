import 'package:ciscos/screens/providers/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Product getData() {
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
    return n;
    //return [..._items];
    //return data;
  }

  final userref = FirebaseFirestore.instance
      .collection('/user/furOEfMe4gwqX4MzK4nN/products');
  Product getUser() {
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
      return n;
    });
  }
}
