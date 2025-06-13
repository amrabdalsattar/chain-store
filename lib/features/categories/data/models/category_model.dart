import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String name;
  final String iconPath;
  final String? imageUrl;

  const CategoryModel({
    required this.name,
    required this.iconPath,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [name, iconPath, imageUrl];
}