import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_divider.dart';
import '../../data/models/supplier_products_response.dart';
import 'supplier_product_card.dart';

class SupplierProductsListView extends StatelessWidget {
  final List<SupplierProductModel> products;
  const SupplierProductsListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder:
          (context, index) => SupplierProductCard(product: products[index]),
      separatorBuilder:
          (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: const CustomDivider(),
          ),
    );
  }
}
