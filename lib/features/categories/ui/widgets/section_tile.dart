import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';

class SectionTile extends StatelessWidget {
  final String title;
  const SectionTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.robotoBlackSemiBold16),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'See all',
                  style: AppTextStyles.rubikGrayRegular12.copyWith(
                    color: ColorsHelper.primaryColor,
                  ),
                ),
                horizontalSpace(4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.r,
                  color: ColorsHelper.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
