import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ciscos/provider/product.dart';
import 'package:ciscos/screens/product_detail_screen.dart';
import 'package:ciscos/widgets/carisole.dart';
import 'package:ciscos/widgets/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // var data = FirebaseFirestore.instance
  //     .collection('/user/furOEfMe4gwqX4MzK4nN/products')
  //     .get();
  final userRef = FirebaseFirestore.instance
      .collection('user/furOEfMe4gwqX4MzK4nN/products');

  @override
  void initState() {
    //getUserById();
    getUsers();
    super.initState();
  }

  List<Product> prd = [];

  List<dynamic> users;
  getUsers() async {
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

    print(snap.docs.length);
    var name;
    snap.docs.forEach((element) {
      Map<String, dynamic> data = element.data();
      Product p = Product(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          price: 5.0,
          imageUrl: data['imageUrl']);

      prd.add(p);
    });

    // print(name);
    setState(() {
      users = snap.docs;
    });
  }

// getUserById() async {
//   var data = await userRef.get().then((value) {
//     print(value.data());
//     print("Data over");
//   });
// }

  @override
  Widget build(BuildContext context) {
    // var products = Provider.of<Product>(context);
    CollectionReference _reference =
        FirebaseFirestore.instance.collection('user');
    //List<Products> productsData = [];
    final cart = Provider.of<Cart>(context);

    @override
    void fetchData() async {
      var prd = await FirebaseFirestore.instance.collection('products').get();
      // mapRecods(prd);
    }

    List<dynamic> users = [];

    userData() async {
      var prefss = await SharedPreferences.getInstance();
      int data = prefss.get(cart.itemCount.toString());
      return await data;
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

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('MyShop'),
          backgroundColor: Colors.teal,
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
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
            // child: StreamBuilder<QuerySnapshot>(
            //   stream: _reference.snapshots(),
            //   builder: ((context, snapshot) {
            //     if (snapshot.hasError || !snapshot.hasData) {
            //       return Center(child: Text("Has some error "));
            //     }

            //     List<Product> items;
            //     Product a;
            //     if (snapshot.hasData &&
            //         (snapshot.connectionState == ConnectionState.active ||
            //             snapshot.connectionState == ConnectionState.active)) {
            //       QuerySnapshot querySnapshot = snapshot.data;
            //       List<QueryDocumentSnapshot> docs = querySnapshot.docs;
            //       docs.forEach((element) {
            //         List<String> l = [];
            //         l.add(element.id);
            //         docs.forEach((element) {
            //           var datas = element.data() as Map;
            //           a = Product(
            //             id: datas['id'],
            //             title: datas['title'],
            //             description: datas['description'],
            //             //price: datas[pric],
            //             imageUrl: datas['imageUrl'],
            //           );
            //           prd.add(a);
            //           //print(do)
            //         });
            //         // print(n);
            //       });
            //       // items = docs
            //       //     .map(
            //       //       (e) => Product(
            //       //         id: e.id,
            //       //         title: e['title'],
            //       //         description: e['description'],
            //       //         price: e['price'],
            //       //       ),
            //       //     )
            //       //     .toList();
            //     } else {
            //       return CircularProgressIndicator();
            //     }
            //     return ListView.builder(
            //         // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         //     crossAxisCount: 2,
            //         //     childAspectRatio: 3 / 2.5,
            //         //     mainAxisSpacing: 10),
            //         itemBuilder: ((context, index) => Card(
            //             color: Theme.of(context).canvasColor,
            //             child: ListTile(
            //               leading: CircleAvatar(),
            //               title: Text(items[index].title),
            //               subtitle: Text(items[index].description),
            //             ))),
            //         itemCount: productsData.length);
            //     // return !snapshot.hasData
            //     //     ? Container(
            //     //         child: CircularProgressIndicator(),
            //     //       )
            //     //     : Container(
            //     //         child: ListView.builder(
            //     //             itemCount: prd.length,
            //     //             itemBuilder: ((context, index) {
            //     //               return ProductItem(
            //     //                 title: prd[index].title,
            //     //                 description: prd[index].description,
            //     //                 price: prd[index].price,
            //     //               );
            //     //             })),
            //   }),
            child: Container(
              child: Column(
                children: [
                  Text(
                    "Top picks currently",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.teal,
                        fontFamily: GoogleFonts.playball().fontFamily,
                        fontSize: 30),
                  ),
                  // Expanded(
                  //     child: StreamBuilder(
                  //   stream: FirebaseFirestore.instance
                  //       .collection('users')
                  //       .snapshots(),
                  //   builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  //     while (!snapshot.hasData) {
                  //       return Center(
                  //           child: Container(
                  //               // color: Colors.yellow,
                  //               child: CircularProgressIndicator()));
                  //     }
                  //     return Container(
                  //         //        color: Colors.yellow,
                  //         // decoration: const BoxDecoration(
                  //         //   image: DecorationImage(
                  //         //       image: AssetImage("assets/hellos.png"),
                  //         //       fit: BoxFit.cover),
                  //         // ),
                  //         child: ListView(
                  //             shrinkWrap: true,
                  //             children: snapshot.data.docs.map((e) {
                  //               return CarouselSliderExample();
                  //             }).toList()));
                  //   }),
                  // )),
                  // Carisole(),
                  Expanded(
                    flex: 1,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('product')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                              child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  child: Image.network(
                                    "https://picsum.photos/250?image=9",
                                  )),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  child: Image.network(
                                    "https://cdn.shopify.com/s/files/1/0722/2059/files/Offers_Infinito_-Hakone-chilli_2_400x.jpg?v=1657529550",
                                  )),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  child: Image.network(
                                    "https://picsum.photos/250?image=9",
                                  )),
                            ],
                          ));
                        }
                        var data = snapshot.data.docs;
                        return ListView(
                          children: data.map((e) {
                            Container(
                              color: Colors.green,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3,
                                      child: Image.network(
                                        "https://picsum.photos/250?image=9",
                                      )),
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3,
                                      child: Image.network(
                                        "https://cdn.shopify.com/s/files/1/0722/2059/files/Offers_Infinito_-Hakone-chilli_2_400x.jpg?v=1657529550",
                                      )),
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3,
                                      child: Image.network(
                                        "https://picsum.photos/250?image=9",
                                      )),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),

                  Divider(),
                  Text(
                    "Our products",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.teal,
                        fontFamily: GoogleFonts.playball().fontFamily,
                        fontSize: 30),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: prd.length,
                    itemBuilder: (ctx, i) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(
                        footer: GridTileBar(
                          backgroundColor: Colors.black87,
                          leading: Consumer<Product>(
                            builder: (ctx, product, _) => IconButton(
                              icon: Icon(
                                product.isFavorite
                                    ? Icons.timer
                                    : Icons.timer_outlined,
                              ),
                              onPressed: () {
                                product.toggleFavoriteStatus();
                              },
                            ),
                          ),
                          title: Text(
                            prd[i].title ?? "Text title",
                            textAlign: TextAlign.center,
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                            ),
                            onPressed: () {
                              cart.addItem(
                                  prd[i].id, prd[i].price, prd[i].title);
                              var name = FirebaseAuth.instance.currentUser.uid;
                              FirebaseFirestore.instance
                                  .collection('$name')
                                  .add({
                                'id': prd[i].id,
                                'price': prd[i].price,
                                'titlr': prd[i].title
                              });
                            },
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ProductDetailScreen.routeName,
                              arguments: prd[i].id,
                            );
                          },
                          child: Image.network(
                            prd[i].imageUrl ??
                                'https://picsum.photos/250?image=9',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
