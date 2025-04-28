class Product {
  final String id;
  final String name;
  final double price;
  final int stock;
  final String? description;
  final String? supplierId;
  final String? sku;
  final int? minimumStock;
  final List<String>? imageUrls;
  final String? categoryName;
  final int? categoryId;
  final List<String>? images;
  final DateTime? updatedDate;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    this.description,
    this.supplierId,
    this.sku,
    this.minimumStock,
    this.imageUrls,
    this.categoryName,
    this.categoryId,
    this.images,
    this.updatedDate,
  });

  Product copyWith({
    String? id,
    String? name,
    double? price,
    int? stock,
    String? description,
    String? supplierId,
    String? sku,
    int? minimumStock,
    List<String>? imageUrls,
    String? categoryName,
    int? categoryId,
    List<String>? images,
    DateTime? updatedDate,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      description: description ?? this.description,
      supplierId: supplierId ?? this.supplierId,
      sku: sku ?? this.sku,
      minimumStock: minimumStock ?? this.minimumStock,
      imageUrls: imageUrls ?? this.imageUrls,
      categoryName: categoryName ?? this.categoryName,
      categoryId: categoryId ?? this.categoryId,
      images: images ?? this.images,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] as int,
      description: json['description'],
      supplierId: json['supplierId'],
      sku: json['sku'],
      minimumStock: json['minimumStock'],
      imageUrls:
          (json['imageUrls'] as List?)?.map((e) => e.toString()).toList(),
      categoryName: json['categoryName'],
      categoryId: json['categoryId'],
      images: (json['images'] as List?)?.map((e) => e.toString()).toList(),
      updatedDate: json['updatedDate'] != null
          ? DateTime.tryParse(json['updatedDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'stock': stock,
        'description': description,
        'supplierId': supplierId,
        'sku': sku,
        'minimumStock': minimumStock,
        'imageUrls': imageUrls, 
        'categoryName': categoryName,
        'categoryId': categoryId,
        'images': images,
        'updatedDate': updatedDate?.toIso8601String(),
      };
}
