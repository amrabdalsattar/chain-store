import 'package:bloc/bloc.dart';

import '../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../../home/data/models/suppliers_response_model.dart';
import '../../data/repos/suppliers_repo.dart';

part 'suppliers_state.dart';

class SuppliersCubit extends Cubit<SuppliersState> {
  final SuppliersRepo _repo;
  SuppliersCubit(this._repo) : super(const SuppliersInitial());

  void exploreSuppliers(String query) async {
    if (query.isEmpty) {
      emit(const SuppliersInitial());
    } else {
      emit(const SuppliersLoading());
      final result = await _repo.exploreSuppliers(query);
      result.when(
        success: (suppliers) {
          if (suppliers.isEmpty) {
            emit(const SuppliersEmpty());
          } else {
            emit(SuppliersLoaded(suppliers));
          }
        },
        failure: (apiErrorModel) {
          emit(SuppliersError(apiErrorModel));
        },
      );
    }
  }
}
