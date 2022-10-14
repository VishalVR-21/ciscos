import 'package:ciscos/screens/Products_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class ProductItem extends StatelessWidget {
  ProductItem();

  @override
  Widget build(BuildContext context) {
    var Pro = Provider.of<Products>(context);
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Product_detail(
                      Product: Pro,
                    )));
          },
          child: Image.network(
            Pro.imageurl,
            fit: BoxFit.cover,
          ),
        ),
        header: Text(Pro.name),
        footer: GridTileBar(
          backgroundColor: Colors.green,
          title: Text(
            Pro.price.toString(),
            textAlign: TextAlign.center,
          ),
          trailing: Icon(Icons.shopping_bag),
        ),
      ),
    );
  }
}
