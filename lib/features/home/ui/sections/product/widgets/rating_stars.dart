import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../core/theming/colors_helper.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final bool showEmptyStars;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 16,
    this.showEmptyStars = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$rating', style: AppTextStyles.robotoBlackBold10),
        horizontalSpace(4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(
              rating.toInt(),
              (index) => Icon(
                Icons.star_rate_rounded,
                color: ColorsHelper.gold,
                size: size.sp,
              ),
            ),
            if (showEmptyStars)
              ...List.generate(
                5 - rating.toInt(),
                (index) => Icon(
                  Icons.star_border,
                  color: ColorsHelper.dividerGray,
                  size: size.sp,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
