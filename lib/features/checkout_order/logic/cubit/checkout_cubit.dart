import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../data/models/payment_intent_input_model.dart';
import '../../data/repos/checkout_repo.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepo _repo;
  CheckoutCubit(this._repo) : super(const CheckoutInitialState());

  bool isCreditCardPayment = true;

  Future<void> executePayment(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    emit(const StripePaymentLoading());

    final result = await _repo.executePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    result.when(
      success: (success) {
        if (!isClosed) {
          emit(const StripePaymentSuccess());
        }
      },
      failure: (apiErrorModel) {
        if (!isClosed) {
          emit(StripePaymentFailure(apiErrorModel));
        }
      },
    );
  }
}
