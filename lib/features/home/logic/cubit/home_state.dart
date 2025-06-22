part of 'home_cubit.dart';

sealed class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

// Top Suppliers
class HomeSuppliersLoadingState extends HomeState {
  const HomeSuppliersLoadingState();
}

class HomeSuppliersLoadedState extends HomeState {
  final List<SupplierDataModel> suppliers;
  const HomeSuppliersLoadedState(this.suppliers);
}

class HomeSuppliersErrorState extends HomeState {
  final ApiErrorModel apiErrorModel;
  const HomeSuppliersErrorState(this.apiErrorModel);
}

// Matched Products

class MatchedProductsLoadingState extends HomeState {
  const MatchedProductsLoadingState();
}

class MatchedProductsLoadedState extends HomeState {
  final List<ProductDataModel> products;
  const MatchedProductsLoadedState(this.products);
}

class MatchedProductsErrorState extends HomeState {
  final ApiErrorModel apiErrorModel;
  const MatchedProductsErrorState(this.apiErrorModel);
}

// Recommended Products

class RecommendedProductsLoadingState extends HomeState {
  const RecommendedProductsLoadingState();
}

class RecommendedProductsLoadedState extends HomeState {
  final List<ProductDataModel> products;
  const RecommendedProductsLoadedState(this.products);
}

class RecommendedProductsErrorState extends HomeState {
  final ApiErrorModel apiErrorModel;
  const RecommendedProductsErrorState(this.apiErrorModel);
}
