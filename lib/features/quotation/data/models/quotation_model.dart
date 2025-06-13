class QuotationModel {
  final String? id;
  final String productName;
  final int quantity;
  final String? notes;
  final String name;
  final String email;
  final String phone;
  final String? companyName;
  final QuotationStatus status;

  QuotationModel({
    this.id,
    required this.productName,
    required this.quantity,
    this.notes,
    required this.name,
    required this.email,
    required this.phone,
    this.companyName,
    this.status = QuotationStatus.pending,
  });

  QuotationModel copyWith({
    String? id,
    String? productName,
    int? quantity,
    String? notes,
    String? name,
    String? email,
    String? phone,
    String? companyName,
    QuotationStatus? status,
  }) {
    return QuotationModel(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      notes: notes ?? this.notes,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      companyName: companyName ?? this.companyName,
      status: status ?? this.status,
    );
  }
}

enum QuotationStatus { pending, approved, rejected }
