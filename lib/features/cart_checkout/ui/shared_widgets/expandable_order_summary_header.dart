import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableOrderSummaryHeader extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const ExpandableOrderSummaryHeader({
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order Summary',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        InkWell(
          onTap: onToggle,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: ColorsHelper.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Text(
                  isExpanded ? 'Hide' : 'Show',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsHelper.primaryColor,
                  ),
                ),
                horizontalSpace(4),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: ColorsHelper.primaryColor,
                  size: 18.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
