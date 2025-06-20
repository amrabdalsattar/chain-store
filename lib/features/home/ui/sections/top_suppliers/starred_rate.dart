import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_text_styles.dart';

class StarredRate extends StatelessWidget {
  final double rating;
  const StarredRate({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$rating', style: AppTextStyles.robotoBlackBold10),
        horizontalSpace(4),
        SvgPicture.asset(AppImages.starIcon, width: 12.w, height: 12.h),
      ],
    );
  }
}
