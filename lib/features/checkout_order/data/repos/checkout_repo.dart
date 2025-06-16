import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/place_order_datasource.dart';
import '../datasources/stripe_service.dart';
import '../models/place_order_models/place_order_request_model.dart';
import '../models/stripe_models/payment_intent_input_model.dart';

class CheckoutRepo {
  final StripeService _stripeService;
  final PlaceOrderDatasource _placeOrderDatasource;
  const CheckoutRepo(this._stripeService, this._placeOrderDatasource);

  Future<ApiResult<void>> executePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await _stripeService.executePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return const ApiResult.success(());
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> placeOrder(
    PlaceOrderRequestModel requestModel,
  ) async {
    try {
      await _placeOrderDatasource.placeOrder(requestModel);
      return const ApiResult.success(());
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
