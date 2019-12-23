import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item_imageview.dart';

class ProductsList extends StatelessWidget {
  ProductsList({@required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductListItem(product: products[index]);
      },
    );
  }
}
