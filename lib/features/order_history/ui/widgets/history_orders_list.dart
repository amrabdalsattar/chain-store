import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import 'order_card.dart';

class HistoryOrdersList extends StatelessWidget {
  const HistoryOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('History', style: AppTextStyles.rubikBlackBold16),
        verticalSpace(18),
        ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const OrderCard(isActive: false),
        ),
      ],
    );
  }
}
