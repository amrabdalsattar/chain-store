import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final void Function()? onSeeAllPressed;

  const HomeSection({super.key, required this.title, this.onSeeAllPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.rubikBlackBold16),
        TextButton(
          onPressed: onSeeAllPressed,
          child: Text(
            'See All',
            style: AppTextStyles.robotoGrayRegular12.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: ColorsHelper.secondaryGray,
            ),
          ),
        ),
      ],
    );
  }
}
