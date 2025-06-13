import 'package:connect_chain_market/core/theming/app_text_styles.dart';
import 'package:connect_chain_market/core/theming/colors_helper.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.robotoWhiteBold16.copyWith(color: ColorsHelper.black),
        ),
        GestureDetector(
          onTap: onSeeAllTap,
          child: Text(
            'See All',
            style: AppTextStyles.robotoDarkGrayMedium14.copyWith(
              color: ColorsHelper.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}