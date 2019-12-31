import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({@required this.products, @required this.cartRepository});
  final List<Product> products;
  final CartRepository cartRepository;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductListItem(
          product: products[index],
          cartRepository: cartRepository,
        );
      },
    );
  }
}
