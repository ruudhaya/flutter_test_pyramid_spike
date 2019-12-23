import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/models/product_model.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/products_list.dart';

import '../../../../mocks/network_image_test_utils.dart';

void main() {
  List<Product> _getProducts() => productsFromJson(json.decode(
      '[{\"upc\":\"0003\",\"name\":\"Apple iPhone 7\",\"price\":\"\$1,099.99\",\"commentsCount\":2,\"image\":\"https:\/\/m.media-amazon.com\/images\/I\/31UU-oejIwL._AC_UY400_QL65_ML3_.jpg\"},{\"upc\":\"0004\",\"name\":\"Simple Mobile Prepaid\",\"price\":\"\$169.45\",\"commentsCount\":7,\"image\":\"https:\/\/m.media-amazon.com\/images\/I\/61ty1FGnI4L._AC_UY436_QL65_ML3_.jpg\"}]'));
  testWidgets('Load Products', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      /// Now we can pump NetworkImages without crashing our tests. Yay!
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(body: ProductsList(products: _getProducts()))));

    //    Expect to find the item on screen.
    expect(find.text('Apple iPhone 7'), findsOneWidget);
    });
  });
}
