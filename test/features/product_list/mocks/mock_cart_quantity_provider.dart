import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/bloc/cart_quantity_provider.dart';

class MockCartQuantityProvider implements CartQuantityProvider {
  int _quantity = 0;

  @override
  int getQuantity(Product product) {
    return _quantity;
  }

  @override
  void setQuantity(Product product, int quantity) {
    _quantity = quantity;
  }
}
