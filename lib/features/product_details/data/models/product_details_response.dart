import '../../../rating&review/data/models/review_model.dart';

class ProductDetailsResponse {
  final String? sku;
  final String name;
  final String description;
  final num price;
  final int stock;
  final int minimumStock;
  final List<String> imageUrls;
  final String categoryName;
  final List<String> sizes;
  final List<String> colors;
  final List<ReviewModel>? reviews;
  final num averageRating;
  final int totalRatings;
  final int totalReviews;
  final bool isStockAvailable;

  ProductDetailsResponse({
    required this.sku,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.minimumStock,
    required this.imageUrls,
    required this.categoryName,
    required this.sizes,
    required this.colors,
    required this.reviews,
    required this.averageRating,
    required this.totalRatings,
    required this.totalReviews,
    required this.isStockAvailable,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> data) {
    final json = data['data'] as Map<String, dynamic>;
    return ProductDetailsResponse(
      sku: json['sku'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      stock: json['stock'] ?? 0,
      minimumStock: json['minimumStock'] ?? 0,
      imageUrls:
          (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      categoryName: json['categoryName'] ?? '',
      sizes:
          (json['sizes'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      colors:
          (json['colors'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map(
                (review) =>
                    ReviewModel.fromJson(review as Map<String, dynamic>),
              )
              .toList() ??
          [],
      averageRating: json['averageRating'] ?? 0,
      totalRatings: json['totalRatings'] ?? 0,
      totalReviews: json['totalReviews'] ?? 0,
      isStockAvailable: json['isStockAvailable'] ?? false,
    );
  }
}
