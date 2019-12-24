import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item_imageview.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem({@required this.product});
  final Product product;

  @override
  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  int _itemCount = 0;

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
                onPressed: () =>
                    setState(() => _itemCount > 0 ? _itemCount-- : null),
              ),
              Text(_itemCount.toString()),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => setState(() => _itemCount++))
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
