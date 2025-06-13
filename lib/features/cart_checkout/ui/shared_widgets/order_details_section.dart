import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDetailRow('Order Number', '#ORD-12345'),
        verticalSpace(12),
        _buildDetailRow('Order Date', 'May 4, 2025'),
        verticalSpace(12),
        _buildDetailRow('Estimated Delivery', 'May 8-10, 2025'),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorsHelper.secondaryGray,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}