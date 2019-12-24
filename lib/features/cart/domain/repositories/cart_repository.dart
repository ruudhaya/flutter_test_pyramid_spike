import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';

abstract class CartRepository {
  int getQuantity(Product product);
  void setQuantity(Product product, int quantity);
}
