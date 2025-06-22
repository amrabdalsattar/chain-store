import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../data/models/customer_orders_response.dart';
import '../../data/repos/orders_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo _repo;
  OrdersCubit(this._repo) : super(const OrdersLoadingState());

  List<OrderDataModel> historyOrders = [];
  List<OrderDataModel> activeOrders = [];
  List<OrderDataModel> pendingOrders = [];

  Future<void> getCustomerOrders() async {
    emit(const OrdersLoadingState());
    final result = await _repo.getCustomerOrders();
    result.when(
      success: (orders) {
        if (orders.isEmpty) {
          if (isClosed) return;
          _filterOrders(orders);
          emit(const OrdersEmptyState());
        } else {
          if (isClosed) return;
          emit(OrdersLoadedState(orders));
        }
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        emit(OrdersErrorState(apiErrorModel));
      },
    );
  }

  void _filterOrders(List<OrderDataModel> orders) {
    historyOrders =
        orders
            .where(
              (order) =>
                  order.status == 'Canceled' ||
                  order.status == 'Completed' ||
                  order.status == 'Rejected',
            )
            .toList();
    activeOrders = orders.where((order) => order.status == 'Accepted').toList();
    pendingOrders = orders.where((order) => order.status == 'Pending').toList();
  }
}
