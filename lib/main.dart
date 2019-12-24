import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/screens/products_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.list)),
                Tab(icon: Icon(Icons.shopping_cart)),
              ],
            ),
            title: const Text('Shopper'),
          ),
          body: TabBarView(
            children: [
              ProductsListScreen(),
              Tab(icon: Icon(Icons.shopping_cart)),
            ],
          ),
        ),
      ),
    );
  }
}
