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

  Product getUser() {
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
  }

  final userRef = FirebaseFirestore.instance
      .collection('user/furOEfMe4gwqX4MzK4nN/products');

  List<Product> prd = [];

  List<dynamic> users;
  getUsers() async {
    // userRef.get().then((value) {
    //   value.docs.forEach((element) {
    //     var datas = element.data();
    //     print(datas);
    //     datas.map((key, value) {
    //       //print(value['title']);
    //       return value;
    //     });
    //     print(value);
    //     //   Product n = Product(id: datas, title: title, description: description, price: price, imageUrl: imageUrl)
    //   });
    final QuerySnapshot snap = await userRef.get();

    print(snap.docs.length);
    var name;
    snap.docs.forEach((element) {
      Map<String, dynamic> data = element.data();
      Product p = Product(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          price: 5.0,
          imageUrl: data['imageUrl']);
      prd.add(p);
    });
  }
}
