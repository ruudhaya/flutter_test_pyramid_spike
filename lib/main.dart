import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/screens/products_list_screen.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/screens/cart_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightGreen[
            400], //Changing this will change the color of the TabBar
        accentColor: Colors.black,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.list)),
                Tab(key: const Key('CartTab'), icon: Icon(Icons.shopping_cart)),
              ],
            ),
            title: const Text('Shopper'),
          ),
          body: TabBarView(
            children: [
              ProductsListScreen(),
              CartScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
