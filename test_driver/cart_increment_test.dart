// import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:flutter_driver/src/driver/driver.dart' as finder;

void main() {
  group('cart increment test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    Future<void> delay([int milliseconds = 250]) async {
      await Future<void>.delayed(Duration(milliseconds: milliseconds));
    }

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      print(health.status);
    });

    test('Verify empty cart message is shown in cart tab on launch', () async {
      await delay(3000);
      final cartTab = finder.find.byValueKey('CartTab');
      await driver.tap(cartTab);
      final errorText = find.byValueKey('ErrorMessage');
      expect(await driver.getText(errorText), 'No Items In Cart');
    });
  });
}
