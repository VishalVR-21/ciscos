import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../provider/product.dart';
import '../provider/provider.dart';

class Product_detail extends StatelessWidget {
  Product_detail({Product Product});

  @override
  Widget build(BuildContext context) {

    
    var productsData = Provider.of<Products>(context);


    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(),
          body: Container(child: Text(productsData.name)),
        ));
  }
}
