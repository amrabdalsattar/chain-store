part of 'supplier_products_cubit.dart';

sealed class SupplierProductsState {
  const SupplierProductsState();
}

class SupplierProductsLoadingState extends SupplierProductsState {
  const SupplierProductsLoadingState();
}

class SupplierProductsLoadedState extends SupplierProductsState {
  final List<SupplierProductModel> products;
  const SupplierProductsLoadedState(this.products);
}

class SupplierProductsErrorState extends SupplierProductsState {
  final ApiErrorModel apiErrorModel;
  const SupplierProductsErrorState(this.apiErrorModel);
}
