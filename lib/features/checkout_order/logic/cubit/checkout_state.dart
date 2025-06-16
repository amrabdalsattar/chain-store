part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {
  const CheckoutState();
}

final class CheckoutInitialState extends CheckoutState {
  const CheckoutInitialState();
}

final class CheckoutOrderLoading extends CheckoutState {
  const CheckoutOrderLoading();
}

final class StripePaymentSuccess extends CheckoutState {
  const StripePaymentSuccess();
}

final class CheckoutOrderFailure extends CheckoutState {
  final ApiErrorModel apiErrorModel;
  const CheckoutOrderFailure(this.apiErrorModel);
}

final class PlaceOrderSuccess extends CheckoutState {
  const PlaceOrderSuccess();
}
