import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';

abstract class ProductsListState {}

class ProductsListInitial extends ProductsListState {}

class ProductsListLoading extends ProductsListState {}

class ProductsListLoaded extends ProductsListState {
  final List<Product> products;
  ProductsListLoaded(this.products);
}

class ProductsListError extends ProductsListState {
  final String message;
  ProductsListError(this.message);
}
