import '../theming/app_text_styles.dart';
import '../theming/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: ColorsHelper.boxShadow,
                offset: const Offset(0, 4),
                blurRadius: 4,
              ),
          ],
          color: isSelected
              ? ColorsHelper.primaryColor
              : ColorsHelper.orderChipBackGroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          style: isSelected
              ? AppTextStyles.cairoWhiteBold14
              : AppTextStyles.cairoBlackRegular16.copyWith(fontSize: 14),
          child: Text(text),
        ),
      ),
    );
  }
}
