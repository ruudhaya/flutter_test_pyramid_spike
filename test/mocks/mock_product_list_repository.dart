import 'package:dartz/dartz.dart';
import 'package:flutter_test_pyramid_spike/core/error/error.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/repositories/products_list_repository.dart';

class MockProductsListRepository implements ProductsListRepository {
  List<Product> products = [];

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    return Right(products);
  }
}
