import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/screens/products_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text("Product List"), backgroundColor: Colors.blueGrey),
            body: ProductsListScreen()));
  }
}
