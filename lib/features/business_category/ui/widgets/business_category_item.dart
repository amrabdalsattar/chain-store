import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessCategoryItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const BusinessCategoryItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isSelected ? ColorsHelper.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(width: 1.r, color: ColorsHelper.borderGray),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: ColorsHelper.boxShadow,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                  : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: _getCategoryColor(title),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  iconPath,
                  width: 20.w,
                  height: 20.h,
                  color: isSelected ? ColorsHelper.white : null,
                ),
              ),
            ),
            horizontalSpace(8),
            Flexible(
              child: Text(
                title,
                style:
                    isSelected
                        ? AppTextStyles.robotoBlackRegular12.copyWith(
                          color: ColorsHelper.white,
                        )
                        : AppTextStyles.robotoBlackRegular12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to get color based on category
  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Mobile Phone':
        return const Color(0xFFFFE8D7); // Light orange
      case 'Electronics':
        return const Color(0xFFD7F0FF); // Light blue
      case 'Sports':
        return const Color(0xFFD7FFE2); // Light green
      case 'Clothes':
        return const Color(0xFFFFD7D7); // Light red
      case 'Bags':
        return const Color(0xFFFFE9D7); // Light yellow
      case 'Other':
        return const Color(0xFFE8E8E8); // Light gray
      default:
        return const Color(0xFFE8E8E8); // Light gray
    }
  }
}
