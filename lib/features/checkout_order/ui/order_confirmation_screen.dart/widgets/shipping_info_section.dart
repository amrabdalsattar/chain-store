import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/cache/shared_preferences_helper.dart';
import '../../../../../core/helpers/cache/shared_preferences_keys.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors_helper.dart';

class ShippingInfoSection extends StatelessWidget {
  const ShippingInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final String address = SharedPreferencesHelper.getString(
      SharedPreferencesKeys.userAddress,
    );
    final String phoneNumber = SharedPreferencesHelper.getString(
      SharedPreferencesKeys.userPhoneNumber,
    );
    final String name = SharedPreferencesHelper.getString(
      SharedPreferencesKeys.userName,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        verticalSpace(4),
        Text(
          phoneNumber,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorsHelper.secondaryGray,
          ),
        ),
        verticalSpace(8),
        Text(
          address,
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
