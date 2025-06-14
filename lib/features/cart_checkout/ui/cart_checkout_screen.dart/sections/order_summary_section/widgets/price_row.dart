import 'package:flutter/material.dart';

import '../../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../../core/utils/format_utils.dart';

class PriceRow extends StatelessWidget {
  final String label;
  final bool isTotalPrice;
  final double value;

  const PriceRow({
    super.key,
    required this.label,
    this.isTotalPrice = false,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        isTotalPrice
            ? AppTextStyles.rubikBlackBold15
            : AppTextStyles.rubikBlackRegular12;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textStyle),
        Text('${priceFormat(value)} EGP', style: textStyle),
      ],
    );
  }
}
