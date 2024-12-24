import 'package:elevate_task/core/utils/result.dart';

import 'package:injectable/injectable.dart';

import '../api/api_manager.dart';
import '../datasource_contract/products_datasource_contract.dart';
import '../model/product_model.dart';

@Injectable(as: ProductsDatasource)
class ProductsDatasourceImpl implements ProductsDatasource {
  ApiManager apiManager;

  @factoryMethod
  ProductsDatasourceImpl({required this.apiManager});

  @override
  Future<Result<List<Product>>> getCategories() {
    return apiManager.getCategories();
  }
}
