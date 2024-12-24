import 'package:elevate_task/features/products_screen/presentaion/widget/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entity/product_entity.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 191 / 249.sp,
        ),
        itemBuilder: (context, index) => ProductItem(
          product: products[index],
        ),
        itemCount: products.length,
      ),
    );
  }
}
