import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/models/products_response_model.dart';
import '../../../home/ui/sections/product/matched_products/product_card.dart';

class CategoryProductsGrid extends StatelessWidget {
  final List<ProductDataModel> products;
  const CategoryProductsGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 134 / 220,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 24.h,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
