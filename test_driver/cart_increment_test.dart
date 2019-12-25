import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:flutter_driver/src/driver/driver.dart' as finder;

void main() {
  group('cart increment/decrement test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      print(health.status);
    });

    test(
        'Verify product is seen in cart page on quantity increment and removed on quantity == 0',
        () async {
      //get add button
      final addButton = finder.find.byValueKey('ProductListItem_Add');

      //tap add button twice
      await driver.tap(addButton);
      await driver.tap(addButton);

      //switch to cart tab by tapping on tabbar icon
      final cartTab = finder.find.byValueKey('Main_CartTab');
      await driver.tap(cartTab);

      //verify that the product is added
      final productNameText =
          finder.find.byValueKey('CartListItem_ProductName');
      expect(await driver.getText(productNameText), 'Android One Power');

      //verify that the quantity is correct
      final quantityText = finder.find.byValueKey('CartListItem_Quantity');
      expect(await driver.getText(quantityText), '(2)');

      //switch to productList tab by tapping on tabbar icon
      final productListTab = finder.find.byValueKey('Main_ProductListTab');
      await driver.tap(productListTab);

      //get remove button
      final removeButton = finder.find.byValueKey('ProductListItem_Remove');

      //tap remove button twice
      await driver.tap(removeButton);
      await driver.tap(removeButton);

      //switch to cart tab by tapping on tabbar icon
      await driver.tap(cartTab);

      //verify that no items in cart message is displayed
      final errorText = find.byValueKey('CartScreen_ErrorMessage');
      expect(await driver.getText(errorText), 'No Items In Cart');

      //switch to productList tab by tapping on tabbar icon
      await driver.tap(productListTab);
    });
  });
}
