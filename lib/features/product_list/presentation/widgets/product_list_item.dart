import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item_imageview.dart';

class ProductListItem extends StatelessWidget {
  ProductListItem({@required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Column(children: <Widget>[
          Divider(height: 5.0),
          ListTile(
            title: Text(
              '${product.name}',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            subtitle: Text(
              '${product.price}',
              style: new TextStyle(
                fontSize: 12.0,
                color: Colors.deepOrangeAccent,
                fontStyle: FontStyle.italic,
              ),
            ),
            leading: Column(
              children: <Widget>[ProductListItemImageView(url: product.image)],
            ),
          )
        ]));
  }
}
