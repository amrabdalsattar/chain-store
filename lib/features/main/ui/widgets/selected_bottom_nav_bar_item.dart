import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_helper.dart';

class SelectedBottomNavBarItem extends StatelessWidget {
  final String assetPath;
  const SelectedBottomNavBarItem({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(assetPath),
      width: 56.w,
      height: 36.h,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: ColorsHelper.primaryColor,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Image.asset(
        assetPath,
        color: ColorsHelper.white,
        fit: BoxFit.scaleDown,
        scale: 4,
      ),
    );
  }
}
