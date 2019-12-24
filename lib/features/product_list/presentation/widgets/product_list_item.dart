import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/bloc/cart_quantity_provider.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item_imageview.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem(
      {@required this.product, @required this.cartQuantityProvider});
  final Product product;
  final CartQuantityProvider cartQuantityProvider;

  @override
  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  int _itemQuantity() =>
      widget.cartQuantityProvider.getQuantity(widget.product);
  void _incrementQuantity() => widget.cartQuantityProvider
      .setQuantity(widget.product, _itemQuantity() + 1);
  void _decrementQuantity() => widget.cartQuantityProvider
      .setQuantity(widget.product, _itemQuantity() - 1);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Column(children: <Widget>[
          const Divider(height: 5.0),
          ListTile(
            title: Text(
              '${widget.product.name}',
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
            subtitle: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                child: Text('${widget.product.price}',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.deepOrangeAccent,
                      fontStyle: FontStyle.italic,
                    ))),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => setState(
                    () => _itemQuantity() > 0 ? _decrementQuantity() : null),
              ),
              Text(_itemQuantity().toString()),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => setState(() => _incrementQuantity()))
            ]),
            leading: Column(
              children: <Widget>[
                ProductListItemImageView(url: widget.product.image)
              ],
            ),
          )
        ]));
  }
}
