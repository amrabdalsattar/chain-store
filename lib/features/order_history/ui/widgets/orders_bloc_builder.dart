import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/shimmer_loading_list.dart';
import '../../logic/cubit/orders_cubit.dart';
import 'orders_screen_content.dart';

class OrdersBlocBuilder extends StatelessWidget {
  const OrdersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        switch (state) {
          case OrdersLoadingState():
            return ShimmerLoadingList(
              itemCount: 5,
              containerWidth: double.infinity,
              containerHeight: 61.h,
              scrollDirection: Axis.vertical,
              listHeight: double.infinity,
            );
          case OrdersLoadedState():
            return const OrdersScreenContent();
          case OrdersEmptyState():
            return const Center(child: Text('No orders found'));
          case OrdersErrorState():
            return Center(
              child: Text(
                state.apiErrorModel.getErrorMessages() ?? 'Unknown Error',
              ),
            );
        }
      },
    );
  }
}
