import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/app_images.dart';
import '../helpers/spacing.dart';
import '../theming/app_text_styles.dart';
import '../theming/colors_helper.dart';

class SocialMediaRegistrationWidgets extends StatelessWidget {
  const SocialMediaRegistrationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(height: 1, color: ColorsHelper.dividerGray),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'او',
                // style: AppTextStyles.cairoSemiOpacityBlackRegular16,
              ),
            ),
            Expanded(
              child: Container(height: 1, color: ColorsHelper.dividerGray),
            ),
          ],
        ),
        verticalSpace(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildSocialMediaButton(AppImages.appleLogo),
            buildSocialMediaButton(AppImages.facebookLogo),
            buildSocialMediaButton(AppImages.googleLogo),
          ],
        ),
      ],
    );
  }

  Container buildSocialMediaButton(String logoPath) {
    return Container(
      width: 90.w,
      height: 48.h,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorsHelper.liteGray,
      ),
      child: SvgPicture.asset(logoPath),
    );
  }
}
