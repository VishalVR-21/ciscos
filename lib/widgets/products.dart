import 'package:ciscos/screens/Products_details.dart';
import 'package:ciscos/screens/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  Product prd;
  String items;
  String title, description, s;
  double price;
  ProductItem(
      {this.title, this.items, this.price, this.s, this.description, this.prd});

  @override
  Widget build(BuildContext context) {
    // var Pro = Provider.of<Product>(context);
    return Container(
      child: Card(
        elevation: 3,
        shadowColor: Colors.black,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Product_detail(
                        Prd: prd,
                      )));
            },
            // child: Image.network(
            //   items.imageUrl,
            //   fit: BoxFit.cover,
            // ),
          ),
          header: Text(title ?? "Title"),
          footer: GridTileBar(
            backgroundColor: Colors.teal,
            title: Text(
              price.toString(),
              textAlign: TextAlign.center,
            ),
            trailing: Icon(Icons.shopping_bag),
          ),
        ),
      ),
    );
  }
}
