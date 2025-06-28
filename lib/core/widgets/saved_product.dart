import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/cart/logic/cart_cubit/cart_cubit.dart';
import '../../features/wishlist/logic/cubit/wishlist_cubit.dart';
import '../helpers/extensions.dart';
import '../helpers/spacing.dart';
import '../routing/routes.dart';
import '../theming/app_text_styles.dart';
import '../theming/colors_helper.dart';
import '../utils/format_utils.dart';
import 'custom_button.dart';
import 'custom_image_widget.dart';
import '../../features/cart/ui/widgets/quantity_control_widget.dart';

class SavedProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final double price;
  final int? quantity;
  final int minimumOrder;
  final bool isCartItem;
  final int productId;
  const SavedProduct({
    super.key,
    required this.productImage,
    required this.productName,
    required this.price,
    this.quantity,
    required this.minimumOrder,
    this.isCartItem = true,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.productDetailsRoute,
          arguments: {
            'cartCubit': context.read<CartCubit>(),
            'wishlistCubit': context.read<WishlistCubit>(),
            'productId': productId,
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product image
            Container(
              width: 100.w,
              height: 100.h,
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: ColorsHelper.homeScaffoldColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CustomImageWidget(
                  fit: BoxFit.cover,
                  imageUrl: productImage,
                ),
              ),
            ),
            // Product details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // Product title
                  Text(
                    productName,
                    style: AppTextStyles.robotoBlackRegular12,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Product subtitle
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 3.w,
                      top: 4.h,
                      bottom: 8.h,
                    ),
                    child: Text(
                      'Available',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyles.robotoFadedBlackRegular16.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  // Product price
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${priceFormat(price)} EGP',
                                maxLines: 1,
                                style: AppTextStyles.robotoBlackBold12.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            verticalSpace(6),
                            // Minimum order quantity
                            Text(
                              'min.order : ${minimumOrder} pcs ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: AppTextStyles.robotoFadedBlackRegular16
                                  .copyWith(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),

                      isCartItem
                          ? QuantityControlWidget(quantity: quantity ?? 0)
                          : CustomButton(
                            title: 'Add to cart',
                            onTap: () {
                              context.read<CartCubit>().addToCart(productId, 1);
                            },
                            width: 103.w,
                            borderColor: ColorsHelper.primaryColor,
                            height: 34.h,
                            radius: 16.r,
                            textStyle: AppTextStyles.robotoExtraBlackWhite12,
                          ),
                    ],
                  ),
                ],
              ),
            ),

            // Quantity controls
          ],
        ),
      ),
    );
  }
}
