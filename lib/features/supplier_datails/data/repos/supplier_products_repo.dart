import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/supplier_products_datasource.dart';
import '../models/supplier_products_response.dart';

class SupplierProductsRepo {
  final SupplierProductsDatasource _datasource;
  const SupplierProductsRepo(this._datasource);

  Future<ApiResult<List<SupplierProductModel>>> getSupplierProducts(
    String supplierId,
  ) async {
    try {
      final result = await _datasource.getSupplierProducts(supplierId);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
