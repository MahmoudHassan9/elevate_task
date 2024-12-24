import 'package:elevate_task/core/utils/result.dart';
import 'package:flutter/foundation.dart';

import '../model/product_model.dart';

abstract class ProductsDatasource {
  Future<Result<List<Product>>> getCategories();
}
