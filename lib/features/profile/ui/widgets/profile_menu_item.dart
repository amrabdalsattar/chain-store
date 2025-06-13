import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side with icon and text
          Row(
            children: [
              // Icon container
              Container(
                width: 32.w,
                height: 32.w,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: SvgPicture.asset(iconPath, width: 18.w, height: 18.h),
              ),
              horizontalSpace(12),
              // Text column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.rubikBlackRegular16),
                  SizedBox(height: 2.h),
                  Text(subtitle, style: AppTextStyles.rubikGrayMedium12),
                ],
              ),
            ],
          ),
          // Right arrow icon
          Icon(Icons.arrow_forward_ios, size: 16.w, color: Colors.black54),
        ],
      ),
    );
  }
}
