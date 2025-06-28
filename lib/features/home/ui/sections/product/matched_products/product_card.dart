import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/extensions.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../core/theming/colors_helper.dart';
import '../../../../../../core/utils/format_utils.dart';
import '../../../../../../core/widgets/loading_indicator.dart';

import '../../../../../cart/logic/cart_cubit/cart_cubit.dart';
import '../../../../../wishlist/logic/cubit/wishlist_cubit.dart';
import '../../../../../wishlist/ui/widgets/wishlist_heart_bloc_listener.dart';
import '../../../../data/models/products_response_model.dart';
import 'widgets/rating_stars.dart';
part 'widgets/product_image.dart';

part 'widgets/product_info.dart';

class ProductCard extends StatelessWidget {
  final ProductDataModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: ProductImage(
                imageUrl: product.image ?? '',
                productId: product.productId!,
              ),
            ),
            verticalSpace(4),
            Expanded(
              flex: 2,
              child: ProductInfo(
                productName: product.name ?? '',
                productPrice: product.price ?? 0,
                productRating: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
