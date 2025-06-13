class BusinessCategoryModel {
  final String name;
  final String iconPath;
  final bool isSelected;

  const BusinessCategoryModel({
    required this.name,
    required this.iconPath,
    this.isSelected = false,
  });

  BusinessCategoryModel copyWith({
    String? name,
    String? iconPath,
    bool? isSelected,
  }) {
    return BusinessCategoryModel(
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}