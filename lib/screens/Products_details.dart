import 'package:flutter/material.dart';

import '../models/models.dart';
import '../provider/product.dart';
import '../provider/provider.dart';

class Product_detail extends StatelessWidget {
  Product prd;
  Product_detail({Product Prd});

  @override
  Widget build(BuildContext context) {
    // var productsData = Provider.of<Products>(context);

    return MaterialApp(
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(),
          body: Container(child:  Text(prd.title?? "Hellos world")),
        ));
  }
}
