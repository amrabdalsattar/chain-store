import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../../core/theming/colors_helper.dart';
import '../../../../../../../core/utils/format_utils.dart';
import '../../../../../../../core/widgets/custom_image_widget.dart';
import '../../../../../../cart/data/models/cart_response_model.dart';

class OrderSummaryCartItem extends StatelessWidget {
  final CartItemModel item;
  const OrderSummaryCartItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: ColorsHelper.homeScaffoldColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CustomImageWidget(
                imageUrl: item.productImage!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName ?? '',
                  style: AppTextStyles.robotoBlackRegular12,

                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity:',
                      style: AppTextStyles.robotoBlackRegular12,
                    ),
                    Text(
                      '${item.quantity} pcs',
                      style: AppTextStyles.robotoGrayRegular10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              '${priceFormat(item.price!)} EGP',
              textAlign: TextAlign.end,
              style: AppTextStyles.rubikBlackBold13,
            ),
          ),
        ],
      ),
    );
  }
}
