class PlaceOrderRequestModel {
  final String paymentMethod;
  final String notes;
  final int discount;

  PlaceOrderRequestModel({
    required this.paymentMethod,
    required this.notes,
    required this.discount,
  });

  Map<String, dynamic> toJson() {
    return {
      'paymentMethod': paymentMethod,
      'notes': notes,
      'discount': discount,
    };
  }
}
