import 'package:flutter/material.dart';

import '../helpers/spacing.dart';
import '../theming/app_text_styles.dart';

class ScreenLabel extends StatelessWidget {
  final String title;
  final String subTitle;
  const ScreenLabel({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          // style: AppTextStyles.cairoDarkGrayBold22,
        ),
        verticalSpace(10),
        Text(
          subTitle,
          // style: AppTextStyles.cairoSemiGreyRegular12,
        ),
      ],
    );
  }
}
