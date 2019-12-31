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
  ProductsListBloc(
      {@required ProductsListRepository repository,
      @required CartRepository cartRepository})
      : assert(repository != null),
        assert(cartRepository != null),
        _repository = repository,
        _cartRepository = cartRepository;

  final ProductsListRepository _repository;
  final CartRepository _cartRepository;

  @override
  ProductsListState get initialState => ProductsListInitial();

  @override
  Stream<ProductsListState> mapEventToState(NoParams event) async* {
    yield ProductsListLoading();
    final output = await _repository.getProducts();
    yield* output.fold((failure) async* {
      yield ProductsListError('Something went wrong!');
    }, (products) async* {
      yield ProductsListLoaded(products);
    });
  }

  @override
  int getQuantity(Product product) {
    return _cartRepository.getQuantity(product);
  }

  @override
  void setQuantity(Product product, int quantity) {
    _cartRepository.setQuantity(product, quantity);
  }
}
