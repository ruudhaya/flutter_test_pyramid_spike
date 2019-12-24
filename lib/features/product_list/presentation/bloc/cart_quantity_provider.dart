import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';

abstract class CartQuantityProvider {
  int getQuantity(Product product);
  void setQuantity(Product product, int quantity);
}
