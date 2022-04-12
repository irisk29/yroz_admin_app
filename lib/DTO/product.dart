import 'package:flutter/foundation.dart';

class Product {
  final String productName;
  final double price;
  final double amount;
  final String? imageUrl;

  Product(this.productName, this.price, this.amount, this.imageUrl);

  Product.fromJson(Map<String, dynamic> json)
      : amount = json['amount'].toDouble(),
        productName = json['name'],
        price = json['price'],
        imageUrl = json.containsKey('imageUrl') ? json['imageUrl'] : null;
}