import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/entities/cart_item.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({@required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: Column(children: <Widget>[
          const Divider(height: 5.0),
          ListTile(
            title: Text(
              '${cartItem.product.name}',
              key: const Key('CartListItem_ProductName'),
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Text('(${cartItem.quantity.toString()})',
                  key: const Key('CartListItem_Quantity'),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
          )
        ]));
  }
}
