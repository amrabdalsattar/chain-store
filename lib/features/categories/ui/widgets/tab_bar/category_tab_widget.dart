import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors_helper.dart';

class CategoryTabWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  const CategoryTabWidget({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      color: isSelected ? ColorsHelper.white : ColorsHelper.tabBarGray,
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
          height: 80.h,
          width: 130.w,
          margin: EdgeInsets.only(left: 5.h),
          child: Center(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
