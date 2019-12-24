import 'package:bloc/bloc.dart';
import 'package:flutter_test_pyramid_spike/core/error/no_params.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/repositories/products_list_repository.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/bloc/cart_quantity_provider.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/bloc/products_list_state.dart';
import 'package:meta/meta.dart';

class ProductsListBloc extends Bloc<NoParams, ProductsListState>
    implements CartQuantityProvider {
  ProductsListBloc({@required this.repository, @required this.cartRepository});

  ProductsListRepository repository;
  CartRepository cartRepository;

  @override
  ProductsListState get initialState => ProductsListInitial();

  @override
  Stream<ProductsListState> mapEventToState(NoParams event) async* {
    yield ProductsListLoading();
    final output = await repository.getProducts();
    yield* output.fold((failure) async* {
      yield ProductsListError('Something went wrong!');
    }, (feedItems) async* {
      yield ProductsListLoaded(feedItems);
    });
  }

  @override
  int getQuantity(Product product) {
    return cartRepository.getQuantity(product);
  }

  @override
  void setQuantity(Product product, int quantity) {
    cartRepository.setQuantity(product, quantity);
  }
}
