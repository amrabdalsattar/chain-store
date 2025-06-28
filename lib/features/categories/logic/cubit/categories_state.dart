part of 'categories_cubit.dart';

sealed class CategoriesState {
  const CategoriesState();
}

class CategoriesLoadingState extends CategoriesState {
  const CategoriesLoadingState();
}

class CategoriesLoadedState extends CategoriesState {
  final List<Category> categories;
  const CategoriesLoadedState(this.categories);
}

class CategoriesErrorState extends CategoriesState {
  final ApiErrorModel apiErrorModel;
  const CategoriesErrorState(this.apiErrorModel);
}

class ProductsLoadingState extends CategoriesState {
  const ProductsLoadingState();
}

class ProductsLoadedState extends CategoriesState {
  final List<ProductDataModel> products;
  const ProductsLoadedState(this.products);
}

class ProductsErrorState extends CategoriesState {
  final ApiErrorModel apiErrorModel;
  const ProductsErrorState(this.apiErrorModel);
}
