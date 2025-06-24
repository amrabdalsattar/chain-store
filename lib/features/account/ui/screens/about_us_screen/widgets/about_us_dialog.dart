import 'package:flutter/material.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/app_text_styles.dart';

class AboutUsDialog extends StatelessWidget {
  final String title;
  final Widget content;

  const AboutUsDialog({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.robotoPrimaryMedium15),
        content,
        verticalSpace(16),
      ],
    );
  }
}
