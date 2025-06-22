import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/home_remote_datasource.dart';
import '../models/products_response_model.dart';
import '../models/suppliers_response_model.dart';

class HomeRepo {
  final HomeRemoteDataSource _dataSource;
  HomeRepo(this._dataSource);

  Future<ApiResult<List<SupplierDataModel>>> getTopSuppliers() async {
    try {
      final result = await _dataSource.getTopSuppliers();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ProductDataModel>>> getMatchedProducts() async {
    try {
      final result = await _dataSource.getMatchedProducts();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ProductDataModel>>> getRecommendedProducts() async {
    try {
      final result = await _dataSource.getRecommendedProducts();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
