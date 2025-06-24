import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/helpers/extensions.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../cart/logic/cart_cubit/cart_cubit.dart';
import '../../../../../../wishlist/logic/cubit/wishlist_cubit.dart';
import '../../../../../data/models/products_response_model.dart';
import '../matched_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchedProductGrid extends StatelessWidget {
  final List<ProductDataModel> products;

  const MatchedProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 154 / 203,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 24.h,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                Routes.productDetailsRoute,
                arguments: {
                  'cartCubit': context.read<CartCubit>(),
                  'wishlistCubit': context.read<WishlistCubit>(),
                  'productId': product.productId,
                },
              );
            },
            child: MatchedProductCard(product: product),
          );
        },
      ),
    );
  }
}
