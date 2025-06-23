import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../data/models/customer_orders_response.dart';
import 'order_card.dart';

class OrdersListView extends StatelessWidget {
  final List<OrderDataModel> orders;
  final bool isActive;
  final String label;
  const OrdersListView({
    super.key,
    required this.orders,
    this.isActive = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: orders.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.rubikBlackBold16),
              verticalSpace(18),
            ],
          ),
        ),
        ListView.builder(
          itemCount: orders.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder:
              (context, index) =>
                  OrderCard(isActive: isActive, orderDataModel: orders[index]),
        ),
      ],
    );
  }
}
