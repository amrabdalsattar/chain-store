import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';

class ProfileSection extends StatelessWidget {
  final List<Widget> widgets;
  final String title;
  const ProfileSection({super.key, required this.widgets, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16),
      decoration: BoxDecoration(
        color: ColorsHelper.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          horizontalSpace(double.infinity),
          Text(title, style: AppTextStyles.rubikBlackMedium14),
          ...widgets,
        ],
      ),
    );
  }
}
