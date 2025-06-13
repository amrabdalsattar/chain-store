import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      color: ColorsHelper.homeScaffoldColor,
      child: Row(
        children: [
          // Logo or Brand Name
          horizontalSpace(15),

          Text.rich(
            TextSpan(
              text: 'Hi',
              style: AppTextStyles.rubikPrimaryBold24,
              children: [
                TextSpan(
                  text: ', Mohamed Alaa',
                  style: AppTextStyles.rubikBlackBold24,
                ),
              ],
            ),
          ),
          SvgPicture.asset(AppImages.wavingHandIcon),
          const Spacer(),

          // Notifications Icon
          SvgPicture.asset(AppImages.cartIcon),
          // Cart Icon
          SvgPicture.asset(AppImages.appBarNotification),
        ],
      ),
    );
  }
}
