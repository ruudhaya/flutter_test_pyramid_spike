import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item.dart';

import '../../../../builders/product_builder.dart';
import '../../../../test_utils/network_image_test_utils.dart';
import '../../mocks/mock_cart_quantity_provider.dart';

void main() {
  testWidgets('ProductListItem widget load', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final products = getProductsFromJson(
          '[{\"upc\":\"0003\",\"name\":\"Apple iPhone 7\",\"price\":\"\$1,099.99\",\"commentsCount\":2,\"image\":\"https:\/\/m.media-amazon.com\/images\/I\/31UU-oejIwL._AC_UY400_QL65_ML3_.jpg\"}]');

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: ProductListItem(
                  product: products[0],
                  cartQuantityProvider: MockCartQuantityProvider()))));

      expect(find.text('Apple iPhone 7'), findsOneWidget);
      expect(find.text('\$1,099.99'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byKey(const Key('ProductListItem_Add')), findsOneWidget);
      expect(find.byKey(const Key('ProductListItem_Remove')), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
    });
  });

  testWidgets('Stepper increment and decrement', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final products = getProductsFromJson(
          '[{\"upc\":\"0003\",\"name\":\"Apple iPhone 7\",\"price\":\"\$1,099.99\",\"commentsCount\":2,\"image\":\"https:\/\/m.media-amazon.com\/images\/I\/31UU-oejIwL._AC_UY400_QL65_ML3_.jpg\"}]');

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: ProductListItem(
                  product: products[0],
                  cartQuantityProvider: MockCartQuantityProvider()))));

      final addButton = find.byKey(const Key('ProductListItem_Add'));
      await tester.tap(addButton);
      await tester.tap(addButton);

      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      final removeButton = find.byKey(const Key('ProductListItem_Remove'));
      await tester.tap(removeButton);

      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });
  });
}
