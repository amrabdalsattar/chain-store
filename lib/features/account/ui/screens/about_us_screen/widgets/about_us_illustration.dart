import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/app_images.dart';
import '../../../../../../core/theming/app_text_styles.dart';

class AboutUsIllustration extends StatelessWidget {
  const AboutUsIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 35.h),
          child: Text('ABOUT US', style: AppTextStyles.robotoBlackBold24),
        ),
        Image.asset(AppImages.aboutUsIllustration, width: 200.w, height: 200.h),
      ],
    );
  }
}
