import 'package:ciscos/screens/Products_details.dart';
import 'package:ciscos/screens/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  Product items;
  ProductItem({this.items});

  @override
  Widget build(BuildContext context) {
    // var Pro = Provider.of<Product>(context);
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Product_detail(
                      Product: items,
                    )));
          },
          child: Image.network(
            items.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: Text(items.title),
        footer: GridTileBar(
          backgroundColor: Colors.green,
          title: Text(
            items.price.toString(),
            textAlign: TextAlign.center,
          ),
          trailing: Icon(Icons.shopping_bag),
        ),
      ),
    );
  }
}
