part of 'suppliers_cubit.dart';

sealed class SuppliersState {
  const SuppliersState();
}

class SuppliersInitial extends SuppliersState {
  const SuppliersInitial();
}

class SuppliersLoading extends SuppliersState {
  const SuppliersLoading();
}

class SuppliersLoaded extends SuppliersState {
  final List<SupplierDataModel> suppliers;
  const SuppliersLoaded(this.suppliers);
}

class SuppliersError extends SuppliersState {
  final ApiErrorModel apiErrorModel;
  const SuppliersError(this.apiErrorModel);
}

class SuppliersEmpty extends SuppliersState {
  const SuppliersEmpty();
}
