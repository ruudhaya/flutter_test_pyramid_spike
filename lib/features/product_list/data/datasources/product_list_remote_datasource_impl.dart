import 'dart:convert';
import 'package:flutter_test_pyramid_spike/core/error/exception.dart';
import 'package:flutter_test_pyramid_spike/core/http/http_client.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/datasources/product_list_remote_datasource.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/models/product_model.dart';

class ProductListRemoteDataSourceImpl implements ProductListRemoteDataSource {
  ProductListRemoteDataSourceImpl({this.httpClient});

  final HttpClient httpClient;

  @override
  Future<List<ProductModel>> getProducts() async {
    final response =
        await httpClient.get('http://www.mocky.io/v2/5e00610e2f00006b0013b349');

    if (response.statusCode != 200) {
      throw APIException();
    }

    return productsFromJson(json.decode(response.body));
  }
}
