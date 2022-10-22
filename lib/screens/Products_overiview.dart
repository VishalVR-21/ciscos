import 'package:ciscos/models/models.dart';
import 'package:ciscos/provider/provider.dart';
import 'package:ciscos/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';

class Product_Screen extends StatefulWidget {
  Product_Screen();

  @override
  State<Product_Screen> createState() => _Product_ScreenState();
}

class _Product_ScreenState extends State<Product_Screen> {
  Stream<QuerySnapshot> _stream;

  CollectionReference _reference = FirebaseFirestore.instance
      .collection('/user/furOEfMe4gwqX4MzK4nN/products/');
  List<Products> productsData = [];
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    var prd = await FirebaseFirestore.instance.collection('products').get();
    // mapRecods(prd);
  }

  // void mapRecods(QuerySnapshot<Map<String, dynamic>> records) {
  //   var lists = records.docs
  //       .map((item) => Products(
  //           id: item.id,
  //           name: item['name'],
  //           des: item['des'],
  //           imageurl: item['imageurl'],
  //           price: item['price']))
  //       .toList();
  //   setState(() {
  //     productsData = lists;
  //   });
  // }

  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context);
    initState() {
      // print(product.getUser());
      super.initState();
    }

    List<Product> prd = [];

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: _reference.snapshots(),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Has some error "));
            }
            List<Product> items;
            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> docs = querySnapshot.docs;
              docs.forEach((element) {
                List<String> l = [];
                l.add(element.id);
                docs.forEach((element) {
                  var datas = element.data() as Map;
                  Product a = Product(
                    id: datas['id'],
                    title: datas['title'],
                    description: datas['description'],
                    //price: datas[pric],
                    imageUrl: datas['imageUrl'],
                  );
                  prd.add(a);
                });
                // print(n);
              });
              // items = docs
              //     .map(
              //       (e) => Product(
              //         id: e.id,
              //         title: e['title'],
              //         description: e['description'],
              //         price: e['price'],
              //       ),
              //     )
              //     .toList();
            }
            // return GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         childAspectRatio: 3 / 2.5,
            //         mainAxisSpacing: 10),
            //     itemBuilder: ((context, index) => Card(
            //         color: Theme.of(context).canvasColor,
            //         child: ProductItem())),
            //     itemCount: productsData.length);
            return !snapshot.hasData
                ? Container(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: prd.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        // leading: Image.network(prd[index].imageUrl),
                        title: Text(prd[index].title == null
                            ? "Hello world"
                            : prd[index].title),
                        subtitle: Text(prd[index].description == null
                            ? "Hello world"
                            : prd[index].description),
                      );
                    }));
          }),
        ),
      ),
    );
  }
}
