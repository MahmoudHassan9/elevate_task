import '../../../../core/utils/result.dart';
import '../entity/product_entity.dart';

abstract class ProductsRepo {
  Future<Result<List<ProductEntity>>> getCategories();
}
