class CategoriesResponse {
  final List<Category> data;

  CategoriesResponse({required this.data});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      data: List<Category>.from(
        json['data'].map((item) => Category.fromJson(item)),
      ),
    );
  }
}

class Category {
  final int id;
  final String name;
  final String description;

  Category({required this.id, required this.name, required this.description});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
    );
  }
}
