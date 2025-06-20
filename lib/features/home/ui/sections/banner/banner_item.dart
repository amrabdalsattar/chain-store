import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/theming/colors_helper.dart';
import '../../../../../core/widgets/custom_button.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 175 / 844,

      decoration: BoxDecoration(
        color: ColorsHelper.darkBannerBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsetsDirectional.only(start: 13.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Just Landed: Must-Have Tech!',
                    style: AppTextStyles.rubikWhiteMedium16,
                  ),

                  Text(
                    'Don’t miss this week’s top picks in mobile and electronics.',
                    style: AppTextStyles.robotoWhiteRegular10,
                  ),
                  CustomButton(
                    textStyle: AppTextStyles.robotoBlackBold12,
                    isArrowed: true,
                    title: 'Shop Now',
                    width: 122.w,
                    radius: 32,
                    color: ColorsHelper.white,
                    borderColor: ColorsHelper.white,
                    height: 36.h,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Image.asset(AppImages.bannerMobile)),
        ],
      ),
    );
  }
}
