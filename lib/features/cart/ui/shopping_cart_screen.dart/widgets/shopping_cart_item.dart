import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/theming/colors_helper.dart';
import '../../../../../core/utils/format_utils.dart';
import '../../../../../core/widgets/custom_image_widget.dart';
import '../../../data/models/cart_response_model.dart';
import 'quantity_control_widget.dart';

class ShoppingCartItem extends StatelessWidget {
  final CartItemModel item;
  const ShoppingCartItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                imageUrl: item.productImage!,
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
                  item.productName!,
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
                              '${priceFormat(item.price!)} EGP',
                              maxLines: 1,
                              style: AppTextStyles.robotoBlackBold12.copyWith(
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          verticalSpace(6),
                          // Minimum order quantity
                          Text(
                            'min.order : ${item.minimumOrder} pcs ',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTextStyles.robotoFadedBlackRegular16
                                .copyWith(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    QuantityControlWidget(quantity: item.quantity!),
                  ],
                ),
              ],
            ),
          ),

          // Quantity controls
        ],
      ),
    );
  }
}
