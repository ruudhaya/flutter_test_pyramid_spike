import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/entities/cart_item.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/widgets/cart_list_item.dart';

class CartList extends StatelessWidget {
  const CartList({@required this.cartItems});
  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (BuildContext context, int index) {
        return CartListItem(cartItem: cartItems[index]);
      },
    );
  }
}
