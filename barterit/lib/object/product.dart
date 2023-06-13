class Product {
  String? productId;
  String? productName;
  String? productCategory;
  String? productDescription;
  String? productPrice;
  String? productQuantity;
  String? productLocation;
  String? productState;
  String? userId;

  Product(
      {this.productId,
      this.productName,
      this.productCategory,
      this.productDescription,
      this.productPrice,
      this.productQuantity,
      this.productLocation,
      this.productState,
      this.userId});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productPrice = json['product_price'];
    productQuantity = json['product_quantity'];
    productLocation = json['product_location'];
    productState = json['product_state'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_Id'] = productId;
    data['product_name'] = productName;
    data['product_category'] = productCategory;
    data['product_description'] = productDescription;
    data['product_price'] = productPrice;
    data['product_quantity'] = productQuantity;
    data['product_location'] = productLocation;
    data['product_state'] = productState;
    data['user_id'] = productId;
    return data;
  }
}
