enum RFQStatus { pending, approved, rejected, completed, closed }

class RFQModel {
  final int? id;
  final String? customerId;
  final String? customerName;
  final int? productId;
  final String? productName;
  final int? categoryId;
  final String? categoryName;
  final String? description;
  final int quantity;
  final String? unit;
  final DateTime? deadline;
  final bool shareBusinessCard;
  final RFQStatus status;
  final List<dynamic> attachments;
  final List<dynamic> supplierAssignments;

  RFQModel({
    this.id,
    this.customerId,
    this.customerName,
    this.productId,
    this.productName,
    this.categoryId,
    this.categoryName,
    this.description,
    required this.quantity,
    this.unit,
    this.deadline,
    this.shareBusinessCard = false,
    this.status = RFQStatus.pending,
    this.attachments = const [],
    this.supplierAssignments = const [],
  });

  factory RFQModel.fromJson(Map<String, dynamic> json) {
    return RFQModel(
      id: json['id'] as int?,
      customerId: json['customerId'] as String?,
      customerName: json['customerName'] as String?,
      productId: json['productId'] as int?,
      productName: json['productName'] as String?,
      categoryId: json['categoryId'] as int?,
      categoryName: json['categoryName'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as int,
      unit: json['unit'] as String?,
      deadline:
          json['deadline'] != null ? DateTime.tryParse(json['deadline']) : null,
      shareBusinessCard: json['shareBusinessCard'] ?? false,
      status: QuotationStatusExtension.fromString(json['status']),
      attachments: json['attachments'] ?? const [],
      supplierAssignments: json['supplierAssignments'] ?? const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'customerName': customerName,
      'productId': productId,
      'productName': productName,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'description': description,
      'quantity': quantity,
      'unit': unit,
      'deadline': deadline?.toIso8601String(),
      'shareBusinessCard': shareBusinessCard,
      'status': status.name,
      'attachments': attachments,
      'supplierAssignments': supplierAssignments,
    };
  }
}

extension QuotationStatusExtension on RFQStatus {
  static RFQStatus fromString(String? status) {
    switch (status?.toLowerCase()) {
      case 'approved':
        return RFQStatus.approved;
      case 'rejected':
        return RFQStatus.rejected;
      case 'completed':
        return RFQStatus.completed;
      case 'closed':
        return RFQStatus.closed;
      default:
        return RFQStatus.pending;
    }
  }
}
