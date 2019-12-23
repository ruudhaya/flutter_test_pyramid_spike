import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/core/error/error.dart';
import 'package:flutter_test_pyramid_spike/core/error/exception.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/datasources/product_list_remote_datasource.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/repositories/products_list_repository.dart';

class ProductsListRepositoryImpl implements ProductsListRepository {
  ProductsListRepositoryImpl({@required this.remoteDataSource});

  final ProductListRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      return Right(products);
    } on APIException {
      return Left(APIFailure(message: 'Api Error'));
    }
  }
}
