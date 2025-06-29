class RfqRecommendedSupplierResponse {
  final List<SuppliersModel> suppliers;

  RfqRecommendedSupplierResponse({required this.suppliers});

  factory RfqRecommendedSupplierResponse.fromJson(Map<String, dynamic> json) {
    return RfqRecommendedSupplierResponse(
      suppliers:
          (json['data'] as List)
              .map((e) => SuppliersModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'data': suppliers.map((e) => e.toJson()).toList()};
  }
}

class SuppliersModel {
  final String supplierId;
  final String name;
  final num rating;

  SuppliersModel({
    required this.supplierId,
    required this.name,
    required this.rating,
  });

  factory SuppliersModel.fromJson(Map<String, dynamic> json) {
    return SuppliersModel(
      supplierId: json['supplierId'] as String,
      name: json['name'] as String,
      rating: json['rating'] as num,
    );
  }

  Map<String, dynamic> toJson() {
    return {'supplierId': supplierId, 'name': name, 'rating': rating};
  }
}
