import 'package:flutter/material.dart';

class Product {
  Product(
      {@required this.upc,
      @required this.name,
      @required this.price,
      @required this.commentsCount,
      @required this.image});

  final String upc;
  final String name;
  final String price;
  final int commentsCount;
  final String image;
}
