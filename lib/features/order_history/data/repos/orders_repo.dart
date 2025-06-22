import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/orders_datasource.dart';
import '../models/customer_orders_response.dart';

class OrdersRepo {
  final OrdersDatasource _datasource;
  const OrdersRepo(this._datasource);

  Future<ApiResult<List<OrderDataModel>>> getCustomerOrders() async {
    try {
      final result = await _datasource.getCustomerOrders();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
