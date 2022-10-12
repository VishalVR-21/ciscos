import 'package:ciscos/models/models.dart';
import 'package:ciscos/provider/provider.dart';
import 'package:ciscos/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product_Screen extends StatefulWidget {
  Product_Screen({super.key});

  @override
  State<Product_Screen> createState() => _Product_ScreenState();
}

class _Product_ScreenState extends State<Product_Screen> {
  List<Products> productsData = [];
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  void fetchData() async {
    var prd = await FirebaseFirestore.instance.collection('products').get();
    mapRecods(prd);
  }

  void mapRecods(QuerySnapshot<Map<String, dynamic>> records) {
    var lists = records.docs
        .map((item) => Products(
            id: item.id,
            name: item['name'],
            des: item['des'],
            imageurl: item['imageurl'],
            price: item['price']))
        .toList();
    setState(() {
      productsData = lists;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2.5,
                mainAxisSpacing: 10),
            itemBuilder: ((context, index) => ProductItem()),
            itemCount: productsData.length),
      ),
    );
  }
}
