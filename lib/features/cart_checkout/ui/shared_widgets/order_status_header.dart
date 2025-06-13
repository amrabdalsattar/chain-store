import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';

class OrderStatusHeader extends StatelessWidget {
  const OrderStatusHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: ColorsHelper.primaryColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check_circle,
            color: ColorsHelper.primaryColor,
            size: 48.w,
          ),
        ),
        verticalSpace(16),
        Text(
          'Order Placed Successfully!',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: ColorsHelper.black,
          ),
        ),
        verticalSpace(8),
        Text(
          'Your order has been confirmed and will be shipped soon.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorsHelper.secondaryGray,
          ),
        ),
      ],
    );
  }
}
