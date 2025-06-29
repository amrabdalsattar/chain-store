class RFQRequestModel {
  final String customerId;
  final String productName;
  final int? productId;
  final int categoryId;
  final String? description;
  final int quantity;
  final String unit;
  final String? deadline;
  final bool? shareBusinessCard;
  final List<String>? attachments;

  RFQRequestModel({
    required this.customerId,
    required this.productName,
    this.productId,
    required this.categoryId,
    this.description,
    required this.quantity,
    required this.unit,
    this.deadline,
    this.shareBusinessCard,
    this.attachments,
  });

  Map<String, dynamic> toJson() {
    return {
      'CustomerId ': customerId,
      'ProductName': productName,
      'ProductId': productId,
      'CategoryId': categoryId,
      'Description': description,
      'Quantity': quantity,
      'Unit': unit,
      'Deadline': deadline,
      'ShareBusinessCard': shareBusinessCard,
      'Attachments': attachments,
    };
  }
}
