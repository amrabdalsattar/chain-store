import 'dart:developer';

import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/stripe_service.dart';
import '../models/payment_intent_input_model.dart';

class CheckoutRepo {
  final StripeService _stripeService;
  const CheckoutRepo(this._stripeService);

  Future<ApiResult<void>> executePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await _stripeService.executePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return const ApiResult.success(());
    } catch (error) {
      log(error.toString());
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
