part of 'home_cubit.dart';

sealed class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

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
