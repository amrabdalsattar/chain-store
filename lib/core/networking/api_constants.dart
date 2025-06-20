class ApiConstants {
  static const String baseUrl = 'http://connectchain.runasp.net/api/';

  // Auth endpoints
  static const String loginEP = 'Account/SignIn';
  static const String signUpEP = 'Account/Register';
  static const String forgetPasswordEP = 'Account/ForgetPassword';
  static const String otpVerificationEP = 'Account/VerifyOtp';
  static const String resetPasswordEP = 'Account/ResetPassword';

  // Notifications Endpoints
  static const String getNotificationsEP =
      'Notification/GetSupplierNotifications';
  static const String updateFCMTokenEP = 'Supplier/UpdateFcmToken';

  // Cart Endpoints
  static const String getCartItemsEP = 'Cart/GetCartItems';

  // Orders Endpoints
  static const String placeOrderEP = 'Order/PlaceOrder';

  // Stripe Endpoints
  static const stripeBaseUrl = 'https://api.stripe.com/v1/';
  static const createPaymentIntentEndPoint = 'payment_intents';
  static const createEphemeralKeyEndPoint = 'ephemeral_keys';

  // Home Endpoints
  static const getTopSuppliersEP = 'Supplier/GetSuppliers';

  // Suppliers Endpoints

  static const exploreSuppliersEP = 'Supplier/SearchByName';

  static const Duration timeOut = Duration(seconds: 20);
}
