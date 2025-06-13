import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_helper.dart';

class RatingStars extends StatelessWidget {
  final int rating;
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
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          rating,
          (index) => Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: Icon(
              Icons.star,
              color: ColorsHelper.primaryColor,
              size: size.sp,
            ),
          ),
        ),
        if (showEmptyStars)
          ...List.generate(
            5 - rating,
            (index) => Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: Icon(
                Icons.star_border,
                color: ColorsHelper.secondaryGray,
                size: size.sp,
              ),
            ),
          ),
      ],
    );
  }
}