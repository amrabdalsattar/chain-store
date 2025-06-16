import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/helpers/cache/shared_preferences_helper.dart';
import '../../../../../../core/helpers/cache/shared_preferences_keys.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../core/theming/colors_helper.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shipping Address Title
          Row(
            children: [
              Text('Shipping Address', style: AppTextStyles.rubikBlackBold16),
            ],
          ),
          verticalSpace(16),

          // Ship to label
          Text('Ship to', style: AppTextStyles.rubikGrayRegular10),
          verticalSpace(8),

          // Address container
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD1D1D1), width: 1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    SharedPreferencesHelper.getString(
                      SharedPreferencesKeys.userAddress,
                    ),
                    style: AppTextStyles.rubikBlackRegular12,
                  ),
                ),
                Icon(Icons.more_vert_sharp, size: 16.w, color: Colors.grey),
              ],
            ),
          ),
          verticalSpace(8),

          // Use different address option
          Row(
            children: [
              Icon(Icons.add, color: ColorsHelper.primaryColor, size: 16.r),
              horizontalSpace(8),
              Text(
                'Use different address',
                style: AppTextStyles.rubikPrimaryBold12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
