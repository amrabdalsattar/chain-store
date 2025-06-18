class SupplierResponseModel {
  final List<SupplierDataModel> suppliers;

  SupplierResponseModel({required this.suppliers});

  factory SupplierResponseModel.fromJson(Map<String, dynamic> json) {
    return SupplierResponseModel(
      suppliers:
          (json['data'] as List)
              .map((e) => SupplierDataModel.fromJson(e))
              .toList(),
    );
  }
}

class SupplierDataModel {
  final String id;
  final String name;
  final String? imageUrl;
  final String businessType;
  final int rating;

  SupplierDataModel({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.businessType,
    required this.rating,
  });

  factory SupplierDataModel.fromJson(Map<String, dynamic> json) {
    return SupplierDataModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      businessType: json['businessType'],
      rating: json['rating'],
    );
  }
}
