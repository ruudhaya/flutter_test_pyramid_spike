import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_pyramid_spike/core/error/no_params.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/bloc/products_list_bloc.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/bloc/products_list_state.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/products_list.dart';
import 'package:flutter_test_pyramid_spike/injection_container.dart';

class ProductsListScreen extends StatefulWidget {
  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  ProductsListBloc _bloc;

  @override
  void initState() {
    _bloc = serviceLocator<ProductsListBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.add(NoParams());
    return Scaffold(
      body: BlocBuilder<ProductsListBloc, ProductsListState>(
          bloc: _bloc,
          builder: (BuildContext context, ProductsListState productsListState) {
            if (productsListState is ProductsListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (productsListState is ProductsListError) {
              return const Center(child: Text('Error!!!'));
            } else if (productsListState is ProductsListLoaded) {
              return ProductsList(
                  products: productsListState.products,
                  cartQuantityProvider: _bloc);
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
    _bloc.close();
    super.dispose();
  }
}
