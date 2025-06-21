import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../data/models/products_response_model.dart';
import '../../data/models/suppliers_response_model.dart';
import '../../data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _repo;
  HomeCubit(this._repo) : super(const HomeInitialState());

  List<SupplierDataModel> localSuppliers = [];
  List<ProductDataModel> localMatchedProducts = [];
  List<ProductDataModel> localRecommendedProducts = [];

  Future<void> getSuppliers() async {
    emit(const HomeSuppliersLoadingState());
    final result = await _repo.getTopSuppliers();
    result.when(
      success: (suppliers) {
        if (isClosed) return;
        localSuppliers = suppliers;
        emit(HomeSuppliersLoadedState(localSuppliers));
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        emit(HomeSuppliersErrorState(apiErrorModel));
      },
    );
  }

  Future<void> getMatchedProducts() async {
    emit(const MatchedProductsLoadingState());
    final result = await _repo.getMatchedProducts();
    result.when(
      success: (products) {
        if (isClosed) return;
        localMatchedProducts = products;
        emit(MatchedProductsLoadedState(localMatchedProducts));
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        emit(MatchedProductsErrorState(apiErrorModel));
      },
    );
  }

  Future<void> getRecommendedProducts() async {
    emit(const RecommendedProductsLoadingState());
    final result = await _repo.getRecommendedProducts();
    result.when(
      success: (products) {
        if (isClosed) return;
        localRecommendedProducts = products;
        emit(RecommendedProductsLoadedState(localRecommendedProducts));
      },
      failure: (apiErrorModel) {
        if (isClosed) return;
        emit(RecommendedProductsErrorState(apiErrorModel));
      },
    );
  }
}
