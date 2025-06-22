part of 'orders_cubit.dart';

sealed class OrdersState {
  const OrdersState();
}

class OrdersLoadingState extends OrdersState {
  const OrdersLoadingState();
}

class OrdersLoadedState extends OrdersState {
  final List<OrderDataModel> orders;
  const OrdersLoadedState(this.orders);
}

class OrdersErrorState extends OrdersState {
  final ApiErrorModel apiErrorModel;
  const OrdersErrorState(this.apiErrorModel);
}

class OrdersEmptyState extends OrdersState {
  const OrdersEmptyState();
}
