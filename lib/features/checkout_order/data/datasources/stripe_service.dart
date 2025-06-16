import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/helpers/cache/shared_preferences_helper.dart';
import '../../../../core/helpers/cache/shared_preferences_keys.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../../../../core/utils/api_keys.dart';
import '../models/stripe_models/ephemeral_key/ephemeral_key_response.dart';
import '../models/stripe_models/init_payment_sheet_input_model.dart';
import '../models/stripe_models/payment_intent/payment_intent_model.dart';
import '../models/stripe_models/payment_intent_input_model.dart';

class StripeService {
  final ApiHelper _apiHelper;
  const StripeService(this._apiHelper);

  String _encodeFormData(Map<String, dynamic> data) {
    return data.entries
        .map(
          (entry) =>
              '${Uri.encodeQueryComponent(entry.key)}=${Uri.encodeQueryComponent(entry.value.toString())}',
        )
        .join('&');
  }

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final bodyMap = paymentIntentInputModel.toJson();
    final encodedBody = _encodeFormData(bodyMap);

    if (kDebugMode) {
      print('Request Body: $encodedBody');
      print(
        'Headers: ${{'Authorization': 'Bearer [REDACTED]', 'Content-Type': 'application/x-www-form-urlencoded'}}',
      );
    }

    final response = await _apiHelper.post(
      ApiRequestModel(
        endPoint: ApiConstants.createPaymentIntentEndPoint,
        baseUrl: ApiConstants.stripeBaseUrl,
        body: encodedBody,

        headers: {
          'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );

    final PaymentIntentModel paymentIntentModel = PaymentIntentModel.fromJson(
      response,
    );
    return paymentIntentModel;
  }

  Future<void> initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: SharedPreferencesHelper.getString(
          SharedPreferencesKeys.userName,
        ),
        paymentIntentClientSecret:
            initPaymentSheetInputModel.paymentIntentClientSecret,
        customerId: initPaymentSheetInputModel.customerId,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
      ),
    );
  }

  Future<String> createEphemeralKey(String customerId) async {
    final encodedBody = _encodeFormData({'customer': customerId});
    final response = await _apiHelper.post(
      ApiRequestModel(
        endPoint: ApiConstants.createEphemeralKeyEndPoint,
        baseUrl: ApiConstants.stripeBaseUrl,
        body: encodedBody,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
          'Stripe-Version': '2024-09-30.acacia',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );

    final EphemeralKeyModel ephemeralKeyModel = EphemeralKeyModel.fromJson(
      response,
    );
    if (kDebugMode) {
      print(
        '/n/n************* Ephemeral Key ${ephemeralKeyModel.secret!} **************\n\n\n\n\n',
      );
    }
    return ephemeralKeyModel.secret!;
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> executePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    final paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel,
    );

    final ephemeralKey = await createEphemeralKey(
      paymentIntentInputModel.customerId!,
    );

    await initPaymentSheet(
      initPaymentSheetInputModel: InitPaymentSheetInputModel(
        customerId: paymentIntentInputModel.customerId!,
        ephemeralKeySecret: ephemeralKey,
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      ),
    );
    await displayPaymentSheet();
  }
}
