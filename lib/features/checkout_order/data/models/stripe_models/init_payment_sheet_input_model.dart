class InitPaymentSheetInputModel {
  final String customerId;
  final String ephemeralKeySecret;
  final String paymentIntentClientSecret;

  InitPaymentSheetInputModel(
      {required this.customerId,
      required this.ephemeralKeySecret,
      required this.paymentIntentClientSecret});
}
