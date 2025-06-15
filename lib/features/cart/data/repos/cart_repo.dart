import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/cart_remote_datasource.dart';
import '../models/cart_response_model.dart';

class CartRepo {
  final CartRemoteDatasource _remoteDatasource;
  const CartRepo(this._remoteDatasource);

  Future<ApiResult<CartInfo>> getCartInfo() async {
    try {
      final result = await _remoteDatasource.getCartInfo();

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
