class ProductsResponseModel {
  final List<ProductDataModel> products;

  ProductsResponseModel({required this.products});

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductsResponseModel(
      products: List<ProductDataModel>.from(
        json['data'].map((x) => ProductDataModel.fromJson(x)),
      ),
    );
  }
}

class ProductDataModel {
  final int? productId;
  final String? name;
  final String? description;
  final double? price;
  final int? stock;
  final String? categoryName;
  final String? image;
  final bool? isStockAvailable;
  final String? supplierName;
  final String? supplierId;
  final String? businessType;
  final double? supplierRating;

  final bool? isInWishlist;

  ProductDataModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.categoryName,
    required this.image,
    required this.isStockAvailable,
    required this.supplierName,
    required this.supplierId,
    required this.businessType,
    required this.supplierRating,

    required this.isInWishlist,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      productId: json['productId'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      stock: json['stock'],
      categoryName: json['categoryName'],
      image: json['image'],
      isStockAvailable: json['isStockAvailable'],
      supplierName: json['supplierName'],
      supplierId: json['supplierId'],
      businessType: json['businessType'],
      supplierRating: (json['supplierRating'] as num).toDouble(),

      isInWishlist: json['isInWishlist'],
    );
  }
}
