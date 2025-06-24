class SupplierProductsResponse {
  final List<SupplierProductModel> products;

  SupplierProductsResponse({required this.products});

  factory SupplierProductsResponse.fromJson(Map<String, dynamic> json) {
    return SupplierProductsResponse(
      products: List<SupplierProductModel>.from(
        json['data'].map((item) => SupplierProductModel.fromJson(item)),
      ),
    );
  }
}

class SupplierProductModel {
  final int? id;
  final String? name;
  final int? stock;
  final double? price;
  final String? categoryName;
  final String? image;

  SupplierProductModel({
    required this.id,
    required this.name,
    required this.stock,
    required this.price,
    required this.categoryName,
    required this.image,
  });

  factory SupplierProductModel.fromJson(Map<String, dynamic> json) {
    return SupplierProductModel(
      id: json['id'],
      name: json['name'],
      stock: json['stock'],
      price: json['price'],
      categoryName: json['categoryName'],
      image: json['image'],
    );
  }
}
