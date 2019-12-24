import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/products_list.dart';

import '../../../../builders/product_builder.dart';
import '../../../../mocks/network_image_test_utils.dart';

void main() {
  testWidgets(
      'ProductList widget loads N ProductListItem widgets, N being products.length',
      (WidgetTester tester) async {
    //provideMockedNetworkImages
    provideMockedNetworkImages(() async {
      final products = getProductsFromJson(
          '[{\"upc\":\"0003\",\"name\":\"Apple iPhone 7\",\"price\":\"\$1,099.99\",\"commentsCount\":2,\"image\":\"https:\/\/m.media-amazon.com\/images\/I\/31UU-oejIwL._AC_UY400_QL65_ML3_.jpg\"},{\"upc\":\"0004\",\"name\":\"Simple Mobile Prepaid\",\"price\":\"\$169.45\",\"commentsCount\":7,\"image\":\"https:\/\/m.media-amazon.com\/images\/I\/61ty1FGnI4L._AC_UY436_QL65_ML3_.jpg\"}]');
      await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: ProductsList(products: products))));

      //Asserts that the [Finder] locates the specified number of widgets in the widget tree.
      expect(find.byType(ProductListItem), findsNWidgets(2));
    });
  });
}
