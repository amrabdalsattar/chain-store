import 'package:bloc/bloc.dart';

import '../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../../home/data/models/products_response_model.dart';
import '../../data/models/categories_response_model.dart';
import '../../data/repos/categories_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo _repo;
  CategoriesCubit(this._repo) : super(const CategoriesLoadingState());

  Future<void> getCategories() async {
    final result = await _repo.getCategories();
    result.when(
      success: (categories) {
        if (isClosed) return;

        emit(CategoriesLoadedState(categories));
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        emit(CategoriesErrorState(apiErrorModel));
      },
    );
  }

  Future<void> getProductsByCategory(int categoryId) async {
    emit(const ProductsLoadingState());
    final result = await _repo.getProductsByCategory(categoryId);
    result.when(
      success: (products) {
        if (isClosed) return;

        emit(ProductsLoadedState(products));
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        emit(ProductsErrorState(apiErrorModel));
      },
    );
  }
}
