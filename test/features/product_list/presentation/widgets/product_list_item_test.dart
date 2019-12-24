import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item.dart';

import '../../../../builders/product_builder.dart';
import '../../../../mocks/mock_cart_quantity_provider.dart';
import '../../../../mocks/network_image_test_utils.dart';

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
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
    });
  });

  testWidgets('Stepper increments and decrements', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final products = getProductsFromJson(
          '[{\"upc\":\"0003\",\"name\":\"Apple iPhone 7\",\"price\":\"\$1,099.99\",\"commentsCount\":2,\"image\":\"https:\/\/m.media-amazon.com\/images\/I\/31UU-oejIwL._AC_UY400_QL65_ML3_.jpg\"}]');

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: ProductListItem(
                  product: products[0],
                  cartQuantityProvider: MockCartQuantityProvider()))));

      final addButton = find.byIcon(Icons.add);
      await tester.tap(addButton);
      await tester.tap(addButton);

      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      final removeButton = find.byIcon(Icons.remove);
      await tester.tap(removeButton);

      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });
  });
}
