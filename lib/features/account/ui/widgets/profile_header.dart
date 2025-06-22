import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? avatarText;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.avatarText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // User Avatar
        Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFDEF4FF),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Center(
            child: Text(
              avatarText ?? name.substring(0, 2).toUpperCase(),
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        horizontalSpace(8),
        // User Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: AppTextStyles.rubikBlackBold20),
            verticalSpace(1),
            Text(email, style: AppTextStyles.rubikGrayMedium12),
          ],
        ),
      ],
    );
  }
}
