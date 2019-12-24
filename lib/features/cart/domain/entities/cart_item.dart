import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';

class CartItem {
  CartItem({@required this.product, @required this.quantity});
  Product product;
  int quantity;
}
