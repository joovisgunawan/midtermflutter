import 'dart:convert';
import 'dart:io';
// import 'package:barterit/mainscreen/selectphotooption.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

import '../phpconfig.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  File? _productImage;
  List<XFile> multiImages = [];
  final ImagePicker _multiPicker = ImagePicker();

  var pathAssets = "assets/images/logo.png";
  // late double screenHeight, screenWidth, cardWidth;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productQuantityController =
      TextEditingController();
  final TextEditingController _productLocationController =
      TextEditingController();
  final TextEditingController _productStateController = TextEditingController();

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
  String selectedCategories = "Electronics";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: List.generate(multiImages.length, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.indigo,
                      ),
                      height: 50,
                      child: Column(
                        children: [
                          Container(
                            child: Image.file(
                              File(multiImages[index].path),
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),

                _productImage != null
                    ? Image.file(
                        _productImage!,
                        width: 200,
                        height: 200,
                      )
                    : Image.network("https://picsum.photos/200/200"),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    pickProductImage();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigo,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('pick image'),
                ),
                const SizedBox(
                  height: 35,
                ),

                // const SizedBox(
                //   height: 35,
                // ),
                // TextButton(
                //   onPressed: () {
                //     getLocation();
                //   },
                //   style: TextButton.styleFrom(
                //     foregroundColor: Colors.white,
                //     backgroundColor: Colors.indigo,
                //     minimumSize: const Size.fromHeight(50),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //   ),
                //   child: const Text('Pick location'),
                // ),
                Form(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: _productNameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Name',
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton(
                                value: selectedCategories,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedCategories = newValue!.toString();
                                    // print(productCategories);
                                    print(newValue);
                                  });
                                },
                                items:
                                    productCategories.map((selectedCategories) {
                                  return DropdownMenuItem(
                                    value: selectedCategories,
                                    child: Text(
                                      selectedCategories,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _productQuantityController,
                                decoration: const InputDecoration(
                                  hintText: 'Quantity',
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _productPriceController,
                                decoration: const InputDecoration(
                                  hintText: 'Price',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _productLocationController,
                                decoration: const InputDecoration(
                                  hintText: 'Location',
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _productStateController,
                                decoration: const InputDecoration(
                                  hintText: 'State',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLines: 4,
                          controller: _productDescriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Description',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      TextButton(
                        onPressed: () {
                          postProduct();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.indigo,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('post'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future pickMultiImages() async {
    //   List<Asset> resultList = <Asset>[];
    // try {
    //   resultList = await MultiImagePicker.pickImages(
    //     maxImages: 5, // Maximum number of images to be picked
    //     enableCamera: true, // Option to enable the camera
    //   );
    // } catch (e) {
    //   print(e.toString());
    // }

    // if (!mounted) return;

    // setState(() {
    //   multiImages.clear();
    //   for (var asset in resultList) {
    //     // Convert the selected Asset objects to Files
    //     var file = await asset.file;
    //     multiImages.add(file);
    //   }
    // });
    final List<XFile> selectedImages = await _multiPicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      multiImages.addAll(selectedImages);
      setState(() {});
      print("the length is${multiImages.length}");
    } else {
      print("No image selected, skipping");
    }
  }

  Future pickProductImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1200,
      maxWidth: 800,
    );
    if (pickedFile != null) {
      _productImage = File(pickedFile.path);
      print(_productImage);
      setState(() {});
      // cropProductImage();
    } else {
      print("No image selected, skipping");
    }
  }

  Future cropProductImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: _productImage!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.ratio4x3,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Cropper",
          toolbarColor: Colors.white,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.ratio4x3,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: "Cropper",
        ),
      ],
    );
    if (croppedFile != null) {
      _productImage = File(croppedFile.path);
      int? sizeInByte = _productImage?.lengthSync();
      double sizeInMB = sizeInByte! / (1024 * 1024);
      print(sizeInMB);
      // setState(() {});
    }
  }

  void getLocation() async {
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(location);
    // return location;
  }

  void confirmation() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Check Your inout")));
      return;
    }
    if (_productImage == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Check Take a picture")));
      return;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          title: const Text("Insert a picture?"),
          content: const Text("Are You sure?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            )
          ],
        );
      },
    );
  }

  void postProduct() {
    String productName = _productNameController.text;
    String productDescription = _productDescriptionController.text;
    String productPrice = _productPriceController.text;
    String productQuantity = _productQuantityController.text;
    String productLocation = _productLocationController.text;
    String productState = _productStateController.text;
    String productImage = base64Encode(_productImage!.readAsBytesSync());
    print(productImage);
    // print(response.body);
    print(productName);
    print(productDescription);
    print(productPrice);
    print(productQuantity);
    print(productLocation);
    print(productState);

    http.post(
      Uri.parse("${PhpConfig().SERVER}/barterlt/php/postproduct.php"),
      body: {
        "product_name": productName,
        "product_description": productDescription,
        "product_price": productPrice,
        "product_quantity": productQuantity,
        "product_location": productLocation,
        "product_state": productState,
        "product_image": productImage,
      },
    ).then(
      (response) {
        // print('SUCESS');
        // print(response.body);
        // print(productName);
        // print(productDescription);
        // print(productPrice);
        // print(productQuantity);
        // print(productLocation);
        // print(productState);

        // if (response.statusCode == 200) {
        //   var jsonData = jsonDecode(response.body);
        //   if (jsonData["status"] == "success") {
        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //       content: Text("Success"),
        //     ));
        //   } else {
        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //       content: Text("Failed"),
        //     ));
        //   }
        // } else {
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: Text("Failed"),
        //   ));
        // }
        // Navigator.pop(context);
      },
    );
  }

  // void _showSelectPhotoOptions(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(25.0),
  //       ),
  //     ),
  //     builder: (context) => DraggableScrollableSheet(
  //         initialChildSize: 0.28,
  //         maxChildSize: 0.4,
  //         minChildSize: 0.28,
  //         expand: false,
  //         builder: (context, scrollController) {
  //           return SingleChildScrollView(
  //             controller: scrollController,
  //             child: SelectPhotoOptionsScreen(
  //               onTap: pickProductImage,
  //             ),
  //           );
  //         }),
  //   );
  // }
}
