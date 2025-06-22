import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/models/products_response_model.dart';
import '../recommended_product_card.dart';

class RecommendedProductsListView extends StatelessWidget {
  final List<ProductDataModel> products;
  const RecommendedProductsListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        itemBuilder:
            (context, index) =>
                RecommendedProductCard(product: products[index]),
      ),
    );
  }
}
