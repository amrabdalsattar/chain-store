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
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? businessType;
  final String? imageUrl;
  final String? activityCategoryName;
  final double? averageRating;
  final double? rating;
  final int? totalRatings;
  final int? totalProducts;
  final List<String>? paymentMethods;

  SupplierDataModel({
    required this.rating,
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.businessType,
    required this.imageUrl,
    required this.activityCategoryName,
    required this.averageRating,
    required this.totalRatings,
    required this.totalProducts,
    required this.paymentMethods,
  });

  factory SupplierDataModel.fromJson(Map<String, dynamic> json) {
    return SupplierDataModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      address: json['address'] ?? '',
      businessType: json['businessType'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      activityCategoryName: json['activityCategoryName'] ?? '',
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      totalRatings: json['totalRatings'] ?? 0,
      totalProducts: json['totalProducts'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      paymentMethods: List<String>.from(json['paymentMethods'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phoneNumber': phoneNumber,
    'address': address,
    'businessType': businessType,
    'imageUrl': imageUrl,
    'activityCategoryName': activityCategoryName,
    'averageRating': averageRating,
    'totalRatings': totalRatings,
    'totalProducts': totalProducts,
    'paymentMethods': paymentMethods,
  };
}
