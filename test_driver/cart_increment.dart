import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/main.dart';
import '../test/mocks/mock_product_list_repository.dart';

MockProductsListRepository mockProductsListRepository() {
  final mockProductsListRepository = MockProductsListRepository();
  mockProductsListRepository.products = [
    const Product(
        upc: '1',
        name: 'Android One Power',
        image:
            'https://m.media-amazon.com/images/I/81hA4nb-+qL._AC_UY436_QL65_ML3_.jpg',
        commentsCount: 10,
        price: '\$138.00')
  ];
  return mockProductsListRepository;
}

void main() {
  enableFlutterDriverExtension();
  runApp(MyApp(productsListRepository: mockProductsListRepository()));
}
