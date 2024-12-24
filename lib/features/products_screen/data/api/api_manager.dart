import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../model/product_model.dart';

@singleton
class ApiManager {
  String productsEndpoint = '/products';

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://fakestoreapi.com',
    ),
  );

  Future<Result<List<Product>>> getCategories() async {
    try {
      var result = await dio.get(productsEndpoint);
      List<Product> products = [];
      for (var product in result.data) {
        products.add(Product.fromJson(product));
      }
      if (result.statusCode! == 200) {
        return Success(
          data: products,
        );
      } else {
        return ServerError(
          message: 'Error',
        );
      }
    } on DioException catch (e) {
      return ServerError(
        message: e.message ?? '',
      );
    }
  }
}
