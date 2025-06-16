class PaymentIntentInputModel {
  final num amount;
  final String currency;
  final String? customerId;

  const PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    this.customerId,
  });

  Map<String, dynamic> toJson() => {
    'amount': (amount * 100).toInt(),
    'currency': currency.toLowerCase(),
    'customer': customerId,
  };
}
