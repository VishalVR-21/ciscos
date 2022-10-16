import 'package:ciscos/provider/product.dart';
import 'package:ciscos/widgets/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../provider/cart.dart';
import './cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var data = FirebaseFirestore.instance
      .collection('/user/furOEfMe4gwqX4MzK4nN/products')
      .get();

  @override
  Widget build(BuildContext context) {
    // var products = Provider.of<Product>(context);
    CollectionReference _reference = FirebaseFirestore.instance
        .collection('/user/furOEfMe4gwqX4MzK4nN/products/');
    List<Products> productsData = [];
    @override
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

    List<Product> prd = [];

    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                print(data);
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Save for later'),
                value: FilterOptions.Favorites,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          // StreamBuilder(
          //     // stream: products
          //     builder: (context, snapshot) {
          //   if (snapshot.hasError) {
          //     return Text('Something went wrong');
          //   }

          //   if (snapshot.connectionState == ConnectionState.waiting) {
          //     return Text("Loading");
          //   }

          //   return ListView.builder(
          //     itemCount: 5,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text("Title"),
          //         subtitle: Text("SUBTITLE"),
          //       );
          //     },
          //   );
          // }),
        ],
      ),
      drawer: AppDrawer(),
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
                      return ProductItem();
                    }));
          }),
        ),
      ),
    ));
  }
}
