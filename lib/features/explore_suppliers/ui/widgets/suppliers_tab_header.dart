import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';

class SuppliersTabHeader extends StatelessWidget {
  const SuppliersTabHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          style: AppTextStyles.rubikBlackBold20.copyWith(fontSize: 18.sp),
          TextSpan(
            text: 'Looking for',

            children: [
              TextSpan(
                text: ' trusted',
                style: AppTextStyles.rubikPrimaryBold20.copyWith(
                  fontSize: 18.sp,
                ),
              ),
              const TextSpan(text: ' suppliers?  🔍'),
            ],
          ),
        ),
        verticalSpace(4),
        Text(
          'Browse verified suppliers, compare ratings, and request a quotation — all in one place.',
          style: AppTextStyles.robotoBlackRegular12,
        ),
      ],
    );
  }
}
