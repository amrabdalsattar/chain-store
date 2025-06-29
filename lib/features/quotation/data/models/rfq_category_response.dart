class RFQCategoryResponse {
  final List<RFQCategoryModel> categories;
  final bool isSuccess;
  final int errorCode;
  final String message;

  RFQCategoryResponse({
    required this.categories,
    required this.isSuccess,
    required this.errorCode,
    required this.message,
  });

  factory RFQCategoryResponse.fromJson(Map<String, dynamic> json) {
    return RFQCategoryResponse(
      categories:
          (json['data'] as List)
              .map((e) => RFQCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      isSuccess: json['isSuccess'] as bool,
      errorCode: json['errorCode'] as int,
      message: json['message'] as String,
    );
  }
}

class RFQCategoryModel {
  final int id;
  final String name;
  final String description;

  RFQCategoryModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory RFQCategoryModel.fromJson(Map<String, dynamic> json) {
    return RFQCategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}
