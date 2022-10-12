import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class Product_detail extends StatelessWidget {
  Product_detail({required Products Product});

  @override
  Widget build(BuildContext context) {
    var productsData = Provider.of<Products>(context);

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Container(child: Text(productsData.name)),
    ));
  }
}
