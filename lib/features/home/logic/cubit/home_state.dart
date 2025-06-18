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
