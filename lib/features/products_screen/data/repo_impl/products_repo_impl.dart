import 'package:elevate_task/core/utils/result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo_contract/products_repo_contract.dart';
import '../datasource_contract/products_datasource_contract.dart';
import '../model/product_model.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  ProductsDatasource datasource;

  @factoryMethod
  ProductsRepoImpl({required this.datasource});

  @override
  Future<Result<List<Product>>> getCategories() async {
    var result = await datasource.getCategories();
    switch (result) {
      case Success<List<Product>>():
        return Success(data: result.data);
      case ServerError<List<Product>>():
        return ServerError(message: result.message);
      case Error<List<Product>>():
        return Error(exception: result.exception);
    }
  }
}
