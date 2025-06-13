import 'package:flutter/material.dart';

import '../../../../../core/theming/app_text_styles.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total(4 item) :', style: AppTextStyles.rubikSemiGreyRegular12),
        Text('240,000 EGP', style: AppTextStyles.rubikBlackRegular16),
      ],
    );
  }
}
