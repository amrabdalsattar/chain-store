part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {
  const CheckoutState();
}

final class CheckoutInitialState extends CheckoutState {
  const CheckoutInitialState();
}

final class StripePaymentLoading extends CheckoutState {
  const StripePaymentLoading();
}

final class StripePaymentSuccess extends CheckoutState {
  const StripePaymentSuccess();
}

final class StripePaymentFailure extends CheckoutState {
  final ApiErrorModel apiErrorModel;
  const StripePaymentFailure(this.apiErrorModel);
}
