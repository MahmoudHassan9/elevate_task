import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entity/product_entity.dart';
import 'loading_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 2,
          color: AppColors.categoryBorder,
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              productImage(product.image!),
              favoriteIcon(),
            ],
          ),
          productDescription(),
        ],
      ),
    );
  }

  Widget favoriteIcon() => Padding(
        padding: REdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 15.r,
            child: ImageIcon(
              const AssetImage(
                AppAssets.favoriteIcon,
              ),
              color: AppColors.main,
              size: 25.sp,
            ),
          ),
        ),
      );

  Widget productDescription() => Padding(
        padding: REdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title ?? '',
              style: AppStyles.categoryTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(8),
            Row(
              children: [
                Text(
                  'EGP${product.price}',
                  style: AppStyles.categoryPrice,
                ),
                horizontalSpace(16),
                Text(
                  '${product.price} EGP',
                  style: AppStyles.categoryOfferPrice,
                ),
              ],
            ),
            verticalSpace(8),
            Row(
              children: [
                Text(
                  'Review',
                  style: AppStyles.categoryReview,
                ),
                horizontalSpace(4),
                Text(
                  product.rating?.rate.toString() ?? '',
                  style: AppStyles.categoryReview,
                ),
                horizontalSpace(4),
                Icon(
                  Icons.star,
                  color: AppColors.star,
                  size: 20.sp,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: ImageIcon(
                    const AssetImage(
                      AppAssets.addIcon,
                    ),
                    color: AppColors.main,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget productImage(url) => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        child: CachedNetworkImage(
          imageUrl: url,
          placeholder: (context, url) => const LoadingWidget(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: double.infinity,
          height: 128.h,
          fit: BoxFit.contain,
        ),
      );
}
