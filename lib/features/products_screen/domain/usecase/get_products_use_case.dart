import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../entity/product_entity.dart';
import '../repo_contract/products_repo_contract.dart';

@injectable
class GetProductsUseCase {
  ProductsRepo repo;

  @factoryMethod
  GetProductsUseCase({required this.repo});

  Future<Result<List<ProductEntity>>> execute() {
    return repo.getCategories();
  }
}
