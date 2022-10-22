import 'package:ciscos/models/payment.dart';
import 'package:ciscos/screens/add_address.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../provider/orders.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final userRef = FirebaseFirestore.instance
        .collection('user/furOEfMe4gwqX4MzK4nN/products');
    final cart = Provider.of<Cart>(context);
    getItems() async {
      WidgetsFlutterBinding.ensureInitialized();
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

      // print(snap.docs.length);
      var name;
      snap.docs.forEach((element) {
        Map<String, dynamic> data = element.data();

        cart.addItem(data['productId'], data['price'], data['title']);
      });
      // print(name);
    }

    List<Cart> carts = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                      label: Text(
                        '\$${carts}',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      backgroundColor: Colors.teal),
                  TextButton(
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.items.values.toList(),
                        cart.totalAmount,
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen()));
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
