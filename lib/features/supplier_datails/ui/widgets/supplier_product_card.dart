import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/utils/format_utils.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../cart/logic/cart_cubit/cart_cubit.dart';
import '../../../wishlist/logic/cubit/wishlist_cubit.dart';
import '../../data/models/supplier_products_response.dart';

class SupplierProductCard extends StatelessWidget {
  final SupplierProductModel product;
  const SupplierProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.pushNamed(
        //   Routes.productDetailsRoute,
        //   arguments: {
        //     'cartCubit': context.read<CartCubit>(),
        //     'wishlistCubit': context.read<WishlistCubit>(),
        //     'productId': product.id,
        //   },
        // );
      },
      child: Container(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: product.image ?? '',
                placeholder: (_, __) => const LoadingIndicator(),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
                width: 75.h,
                height: 75.h,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    '${product.name ?? ''}',
                    style: AppTextStyles.robotoBlackRegular12,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(8),
                  Text(
                    'min. Order : ${((product.stock ?? 0) ~/ 2)}',
                    style: AppTextStyles.robotoBlackRegular12.copyWith(
                      color: ColorsHelper.rejectedOrderBackGroundColor,
                    ),
                  ),
                  verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${priceFormat(product.price ?? 0)} EGP',
                        style: AppTextStyles.robotoBlackBold16,
                      ),
                      Text(
                        'View Details',
                        style: AppTextStyles.robotoPrimaryBold10.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
