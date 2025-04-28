import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../theming/app_text_styles.dart';

class ActionableTextRow extends StatelessWidget {
  final String text;
  final String actionText;
  final void Function()? onTap;

  const ActionableTextRow({
    super.key,
    required this.text,
    this.onTap,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
                text: "$text ",
                style: AppTextStyles.cairoSemiOpacityBlackRegular16),
            TextSpan(
              text: actionText,
              style: AppTextStyles.cairoPrimaryBold16,
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
