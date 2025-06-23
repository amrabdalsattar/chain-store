import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/utils/format_utils.dart';
import '../../data/models/customer_orders_response.dart';
import 'timeline/order_time_line.dart';
import 'products_images_row.dart';

class OrderCard extends StatelessWidget {
  final bool isActive;
  final OrderDataModel orderDataModel;
  const OrderCard({
    super.key,
    required this.isActive,
    required this.orderDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsHelper.borderGray, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            title: Text(
              'Order No. ${orderDataModel.orderNumber}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.robotoBlackMedium14,
            ),

            subtitle: Text(
              '${priceFormat(orderDataModel.subTotal)} EGP .  ${getDateFromTimeStamp(orderDataModel.orderDate.toString())}',
              style: AppTextStyles.rubikGrayRegular10,
            ),
            trailing: FittedBox(
              fit: BoxFit.scaleDown,
              child: ProductsImagesRow(
                urls:
                    orderDataModel.products.map((e) => e.productImage).toList(),
              ),
            ),
          ),
          Visibility(
            visible: isActive,
            child: Container(
              padding: EdgeInsets.only(bottom: 12.r),
              child: const OrderTimeline(currentStatus: 'Shipping'),
            ),
          ),
        ],
      ),
    );
  }
}
