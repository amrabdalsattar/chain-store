enum QuotationStatus { pending, approved, rejected, ordered }

class QuotationResponseModel {
  final List<QuotationModel> data;
  final bool isSuccess;
  final int errorCode;
  final String message;

  QuotationResponseModel({
    required this.data,
    required this.isSuccess,
    required this.errorCode,
    required this.message,
  });

  factory QuotationResponseModel.fromJson(Map<String, dynamic> json) {
    return QuotationResponseModel(
      data:
          (json['data'] as List)
              .map((e) => QuotationModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      isSuccess: json['isSuccess'] as bool,
      errorCode: json['errorCode'] as int,
      message: json['message'] as String,
    );
  }
}

class QuotationModel {
  final int id;
  final int rfqId;
  final String supplierId;
  final String supplierName;
  final int productId;
  final int quantity;
  final int paymentTermId;
  final double unitPrice;
  final int deliveryTimeInDays;
  final String deliveryTerm;
  final double deliveryFee; 
  final String notes;
  final String validUntil;
  final String createdAt;

  QuotationModel({
    required this.id,
    required this.rfqId,
    required this.supplierId,
    required this.supplierName,
    required this.productId,
    required this.quantity,
    required this.paymentTermId,
    required this.unitPrice,
    required this.deliveryTimeInDays,
    required this.deliveryTerm,
    required this.deliveryFee,
    required this.notes,
    required this.validUntil,
    required this.createdAt,
  });

  factory QuotationModel.fromJson(Map<String, dynamic> json) {
    return QuotationModel(
      id: json['id'] as int,
      rfqId: json['rfqId'] as int,
      supplierId: json['supplierId'] as String,
      supplierName: json['supplierName'] as String,
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
      paymentTermId: json['paymentTermId'] as int,
      unitPrice: (json['unitPrice'] as num).toDouble(),
      deliveryTimeInDays: json['deliveryTimeInDays'] as int,
      deliveryTerm: json['deliveryTerm'] as String,
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      notes: json['notes'] as String,
      validUntil: json['validUntil'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rfqId': rfqId,
      'supplierId': supplierId,
      'supplierName': supplierName,
      'productId': productId,
      'quantity': quantity,
      'paymentTermId': paymentTermId,
      'unitPrice': unitPrice,
      'deliveryTimeInDays': deliveryTimeInDays,
      'deliveryTerm': deliveryTerm,
      'deliveryFee': deliveryFee,
      'notes': notes,
      'validUntil': validUntil,
      'createdAt': createdAt,
    };
  }
}
