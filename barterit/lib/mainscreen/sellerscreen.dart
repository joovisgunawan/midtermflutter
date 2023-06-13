import 'dart:convert';

import 'package:barteritcopy/mainscreen/postscreen.dart';
import 'package:barteritcopy/object/product.dart';
import 'package:barteritcopy/phpconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import '../object/user.dart';
import 'package:http/http.dart' as http;


class SellerScreen extends StatefulWidget {
  final User user;
  const SellerScreen({super.key, required this.user});

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  List productList = [];
  @override
  void initState() {
    super.initState();
    getSellerProduct();
  }

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Column(
    //     children: [
    //       Text(widget.user.name.toString()),
    //       TextButton(
    //         onPressed: () {
    //           Navigator.pushReplacement(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => SplashScreen(),
    //             ),
    //           );
    //         },
    //         style: TextButton.styleFrom(
    //           primary: Colors.indigo,
    //           backgroundColor: Color(0xffF7FFF7),
    //           minimumSize: Size.fromHeight(50),
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(8),
    //           ),
    //           side: const BorderSide(
    //             color: Colors.indigo,
    //             style: BorderStyle.solid,
    //           ),
    //         ),
    //         child: const Text('Sign up'),
    //       ),
    //       TextButton(
    //         onPressed: () {
    //           getSellerProduct();
    //         },
    //         style: TextButton.styleFrom(
    //           primary: Colors.indigo,
    //           backgroundColor: Color(0xffF7FFF7),
    //           minimumSize: Size.fromHeight(50),
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(8),
    //           ),
    //           side: const BorderSide(
    //             color: Colors.indigo,
    //             style: BorderStyle.solid,
    //           ),
    //         ),
    //         child: const Text('Test'),
    //       ),
    //       productList.isEmpty
    //           ? Text('data is empty')
    //           : Expanded(
    //               flex: 1,
    //               child: ListView.builder(
    //                 scrollDirection: Axis.vertical,
    //                 itemCount: productList.length,
    //                 itemBuilder: (context, index) {
    //                   return Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Container(
    //                       height: 200,
    //                       width: 100,
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(8),
    //                         color: Colors.indigo,
    //                       ),
    //                       child: const Center(
    //                         child: Text(
    //                           'Swimming',
    //                           style: TextStyle(color: Colors.white),
    //                         ),
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               ),
    //               // child: ListView(
    //               //   scrollDirection: Axis.horizontal,
    //               //   children: [
    //               //     Padding(
    //               //       padding: const EdgeInsets.all(8.0),
    //               //       child: Container(
    //               //         height: 50,
    //               //         width: 100,
    //               //         decoration: BoxDecoration(
    //               //             borderRadius: BorderRadius.circular(8),
    //               //             color: Colors.white),
    //               //         child: const Center(
    //               //           child: Text(
    //               //             'Swimming',
    //               //           ),
    //               //         ),
    //               //       ),
    //               //     ),
    //               //   ],
    //               // ),
    //             ),
    //     ],
    //   ),
    // );
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
            const Row(
              children: [
                Text('Total Transaction Today : '),
                Text('RMxxxx'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your Product',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.green,
                        // minimumSize: Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.add),
                          Text('add product'),
                        ],
                      )),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 175,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.indigo,
                      ),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImageWithRetry(
                              '"${PhpConfig().SERVER}/barterly/assets/images/${productList[index].productId}.png",',
                            ),
                            errorBuilder: (context, exception, stackTrack) =>
                                const Icon(
                              Icons.error,
                            ),
                            loadingBuilder: (context, exception, stackTrack) =>
                                const CircularProgressIndicator(),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "RM ${double.parse(productList[index].productPrice.toString()).toStringAsFixed(2)}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  productList[index].productCategory.toString(),
                                  style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${productList[index].productQuantity.toString()} left",
                                  style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  productList[index].productLocation.toString(),
                                  style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
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
    );
  }

  void getSellerProduct() {
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
