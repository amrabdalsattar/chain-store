import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/data/models/suppliers_response_model.dart';
import '../datasources/suppliers_datasource.dart';

class SuppliersRepo {
  final SuppliersDatasource _datasource;
  const SuppliersRepo(this._datasource);

  Future<ApiResult<List<SupplierDataModel>>> exploreSuppliers(
    String query,
  ) async {
    try {
      final result = await _datasource.exploreSuppliers(query);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
