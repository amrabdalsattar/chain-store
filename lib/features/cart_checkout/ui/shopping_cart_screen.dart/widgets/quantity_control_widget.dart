import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/theming/colors_helper.dart';

class QuantityControlWidget extends StatelessWidget {
  const QuantityControlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: ColorsHelper.liteGray,
      ),
      child: Row(
        children: [
          Icon(Icons.remove, size: 16.w, color: ColorsHelper.black),
          horizontalSpace(8),
          Text('1', style: AppTextStyles.robotoBlackRegular12),
          horizontalSpace(8),

          Icon(Icons.add, size: 16.w, color: ColorsHelper.black),
        ],
      ),
    );
  }
}
