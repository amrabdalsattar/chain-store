import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/models/customer_orders_response.dart';
import 'pending_orders_list.dart';

class OrdersScreenContent extends StatelessWidget {
  final List<OrderDataModel> historyOrders;
  final List<OrderDataModel> activeOrders;
  final List<OrderDataModel> pendingOrders;

  const OrdersScreenContent({
    super.key,
    required this.historyOrders,
    required this.activeOrders,
    required this.pendingOrders,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: OrdersListView(
            orders: activeOrders,
            label: 'Active',
            isActive: true,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(38)),
        SliverToBoxAdapter(
          child: OrdersListView(orders: pendingOrders, label: 'Pending'),
        ),
        SliverToBoxAdapter(child: verticalSpace(38)),
        SliverToBoxAdapter(
          child: OrdersListView(orders: historyOrders, label: 'History'),
        ),
      ],
    );
  }
}
