import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';

class ShippingInfoSection extends StatelessWidget {
  const ShippingInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'John Doe',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        verticalSpace(4),
        Text(
          '+20 123 456 7890',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorsHelper.secondaryGray,
          ),
        ),
        verticalSpace(8),
        Text(
          '123 Main Street, Apartment 4B, Cairo, Egypt, 12345',
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