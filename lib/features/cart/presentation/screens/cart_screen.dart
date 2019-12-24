import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/core/error/no_params.dart';
import 'package:flutter_test_pyramid_spike/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/blocs/cart_state.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/widgets/cart_list.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CartBloc(repository: CartRepositoryImpl());
  }

  @override
  Widget build(BuildContext context) {
    bloc.add(NoParams());
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
          bloc: bloc,
          builder: (BuildContext context, CartState cartState) {
            if (cartState is CartLoading) {
              return Center(child: const CircularProgressIndicator());
            } else if (cartState is CartError) {
              return const Text('Error!!!');
            } else if (cartState is CartLoaded) {
              return CartList(
                cartItems: cartState.cartItems,
              );
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
