import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import 'active_orders_list.dart';
import 'history_orders_list.dart';
import 'pending_orders_list.dart';

class OrdersScreenContent extends StatelessWidget {
  const OrdersScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: ActiveOrdersList()),
        SliverToBoxAdapter(child: verticalSpace(38)),
        const SliverToBoxAdapter(child: PendingOrdersList()),
        SliverToBoxAdapter(child: verticalSpace(38)),
        const SliverToBoxAdapter(child: HistoryOrdersList()),
      ],
    );
  }
}
