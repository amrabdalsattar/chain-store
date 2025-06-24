import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../data/models/supplier_products_response.dart';
import '../../data/repos/supplier_products_repo.dart';

part 'supplier_products_state.dart';

class SupplierProductsCubit extends Cubit<SupplierProductsState> {
  final SupplierProductsRepo _repo;
  SupplierProductsCubit(this._repo)
    : super(const SupplierProductsLoadingState());
  List<SupplierProductModel> supplierProducts = [];

  Future<void> getSupplierProducts(String supplierId) async {
    emit(const SupplierProductsLoadingState());
    final result = await _repo.getSupplierProducts(supplierId);
    result.when(
      success: (products) {
        if (isClosed) return;
        supplierProducts = products;
        emit(SupplierProductsLoadedState(supplierProducts));
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        emit(SupplierProductsErrorState(apiErrorModel));
      },
    );
  }
}
