import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../object/user.dart';
import '../phpconfig.dart';
import '../object/product.dart';
// import 'package:like_button/like_button.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List productList = [];
  List productCategories = [
    "Electronics",
    "Fashion and Clothing",
    "Home and Kitchen",
    "Sports and Fitness",
    "Health and Beauty",
    "Books and Media",
    "Toys and Games",
    "Automotive",
    "Baby and Kids",
    "Pet Supplies",
  ];
  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi ${widget.user.name.toString()}',
                  style: const TextStyle(
                      color: Colors.indigo,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.trolley),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.message),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.only(left: 12, right: 16),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                  hintText: 'Search Something',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productCategories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.indigo,
                            ),
                            child: const Center(
                              child: Text(
                                'Swimming',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // child: ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Container(
                    //         height: 50,
                    //         width: 100,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(8),
                    //             color: Colors.white),
                    //         child: const Center(
                    //           child: Text(
                    //             'Swimming',
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                Text(
                  'Category',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              // child: GridView.count(
              //   shrinkWrap: true,
              //   crossAxisCount: 2,
              //   mainAxisSpacing: 12,
              //   crossAxisSpacing: 12,
              //   children: List.generate(8, (index) {
              //     return Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8),
              //         color: Colors.indigo,
              //       ),
              //       child: Column(
              //         children: [
              //           // height: double,
              //           // width: double.infinity,
              //           Container(
              //             child: Image.network(
              //               "https://picsum.photos/190/170",
              //               width: double.infinity,
              //             ),
              //           ),
              //         ],
              //       ),
              //       height: 50,
              //     );
              //   }),
              // ),
              child: GridView.builder(
                itemCount: 8,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) {
                  var i = index;
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.indigo,
                      ),
                      height: 300,
                      // width: 50,
                      // color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.network(
                              "https://picsum.photos/190/170",
                              width: double.infinity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "productName",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Product Category",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  "productLocation",
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "RM 100",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.add_shopping_cart_outlined,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getProduct() {
    print('succces');
    // if (widget.user.id = 'na') {
    //   return;
    // }
    http.post(
      // Uri.parse("${PhpConfig().SERVER}/barterlt/php/signin.php"),
      Uri.parse("${PhpConfig().SERVER}/barterlt/php/getproduct.php"),
      body: {
        'user_id': widget.user.id,
      },
    ).then((response) {
      print(response);
      print('succces');
      productList.clear();
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        if (jsondata['status'] == 'success') {
          var extractData = jsondata['data'];
          extractData['product'].forEach((product) {
            productList.add(Product.fromJson(product));
          });
          print(productList[0].productName);
        }
        setState(() {});
      }
    });
  }
}
