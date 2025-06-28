import '../../../../core/helpers/cache/shared_preferences_helper.dart';
import '../../../../core/helpers/cache/shared_preferences_keys.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/format_utils.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.h,
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: 'Hi',
                style: AppTextStyles.rubikPrimaryBold20,
                children: [
                  TextSpan(
                    text:
                        ', ${getFirstName(SharedPreferencesHelper.getString(SharedPreferencesKeys.userName))}',
                    style: AppTextStyles.rubikBlackBold20,
                  ),
                ],
              ),
            ),
            verticalSpace(5),
            Text(
              'Let’s Find Your Next Deal',
              style: AppTextStyles.robotoBlackRegular12,
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined),
          onPressed: () {},
          iconSize: 22.r,
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
          iconSize: 22.r,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
