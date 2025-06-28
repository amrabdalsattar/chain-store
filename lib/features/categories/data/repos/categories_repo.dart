import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/data/models/products_response_model.dart';
import '../datasources/categories_datasource.dart';
import '../models/categories_response_model.dart';

class CategoriesRepo {
  final CategoriesDatasource _datasource;
  const CategoriesRepo(this._datasource);

  Future<ApiResult<List<Category>>> getCategories() async {
    try {
      final result = await _datasource.getCategories();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ProductDataModel>>> getProductsByCategory(
    int categoryId,
  ) async {
    try {
      final result = await _datasource.getProductsByCategory(categoryId);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
