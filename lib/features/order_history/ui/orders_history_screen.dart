import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/basic_app_bar.dart';
import 'widgets/orders_bloc_builder.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Orders History'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: const OrdersBlocBuilder(),
      ),
    );
  }
}
