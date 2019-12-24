import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_pyramid_spike/core/error/no_params.dart';
import 'package:flutter_test_pyramid_spike/core/http/http_client_impl.dart';
import 'package:flutter_test_pyramid_spike/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/datasources/product_list_remote_datasource_impl.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/repositories/products_list_repository_impl.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/bloc/products_list_bloc.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/bloc/products_list_state.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/products_list.dart';
import 'package:http/http.dart' as http;

class ProductsListScreen extends StatefulWidget {
  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  ProductsListBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ProductsListBloc(
        cartRepository: CartRepositoryImpl(),
        repository: ProductsListRepositoryImpl(
            remoteDataSource: ProductListRemoteDataSourceImpl(
                httpClient: HttpClientImpl(client: http.Client()))));
  }

  @override
  Widget build(BuildContext context) {
    bloc.add(NoParams());
    return Scaffold(
      body: BlocBuilder<ProductsListBloc, ProductsListState>(
          bloc: bloc,
          builder: (BuildContext context, ProductsListState productsListState) {
            if (productsListState is ProductsListLoading) {
              return Center(child: const CircularProgressIndicator());
            } else if (productsListState is ProductsListError) {
              return const Text('Error!!!');
            } else if (productsListState is ProductsListLoaded) {
              return ProductsList(
                  products: productsListState.products,
                  cartQuantityProvider: bloc);
            }
            return Container(
                color: Colors.white,
                height: double.infinity,
                width: double.infinity);
          }),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
