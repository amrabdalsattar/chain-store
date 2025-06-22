class WishlistResponse {
  final List<WishlistProductModel> wishlistProducts;

  WishlistResponse({required this.wishlistProducts});

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      wishlistProducts: List<WishlistProductModel>.from(
        json['data'].map((x) => WishlistProductModel.fromJson(x)),
      ),
    );
  }
}

class WishlistProductModel {
  final int productId;
  final String? name;
  final double? price;
  final int? stock;
  final String? categoryName;
  final String? image;
  final bool? isStockAvailable;
  final DateTime? addedToWishlistDate;

  WishlistProductModel({
    required this.productId,
    this.name,
    this.price,
    this.stock,
    this.categoryName,
    this.image,
    this.isStockAvailable,
    this.addedToWishlistDate,
  });

  factory WishlistProductModel.fromJson(Map<String, dynamic> json) {
    return WishlistProductModel(
      productId: json['productId'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      stock: json['stock'],
      categoryName: json['categoryName'],
      image: json['image'],
      isStockAvailable: json['isStockAvailable'],
      addedToWishlistDate: DateTime.parse(json['addedToWishlistDate']),
    );
  }
}
