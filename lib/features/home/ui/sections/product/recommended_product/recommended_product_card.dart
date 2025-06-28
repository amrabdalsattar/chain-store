import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theming/colors_helper.dart';
import '../../../../data/models/products_response_model.dart';
import '../matched_products/product_card.dart';

class RecommendedProductCard extends StatelessWidget {
  final ProductDataModel product;
  const RecommendedProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 12.w),
      padding: EdgeInsets.only(top: 10.h),
      width: 120.w,
      decoration: BoxDecoration(
        color: ColorsHelper.homeScaffoldColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ProductImage(
              productId: product.productId!,
              imageUrl: product.image ?? '',
              hasConstrains: true,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w, top: 5.h, end: 10),
            child: ProductInfo(
              productName: product.name ?? '',
              productPrice: product.price ?? 0,

              isRated: false,
            ),
          ),
        ],
      ),
    );
  }
}
