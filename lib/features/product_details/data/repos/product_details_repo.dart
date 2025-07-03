import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasource/product_details_datasource.dart';
import '../models/product_details_response.dart';

class ProductDetailsRepo {
  final ProductDetailsDatasource _datasource;

  ProductDetailsRepo(this._datasource);

  Future<ApiResult<ProductDetailsResponse>> getProductDetails(
    int productId,
  ) async {
    try {
      final result = await _datasource.getProductDetails(productId);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  
}
