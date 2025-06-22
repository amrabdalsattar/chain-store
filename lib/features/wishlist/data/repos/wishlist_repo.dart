import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/wishlist_datasource.dart';
import '../models/wishlist_response.dart';

class WishlistRepo {
  final WishlistDatasource _datasource;
  const WishlistRepo(this._datasource);

  Future<ApiResult<List<WishlistProductModel>>> getWishlistItems() async {
    try {
      final result = await _datasource.getWishlistItems();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> addToWishlist(int productId) async {
    try {
      await _datasource.addToWishlist(productId);
      return const ApiResult.success(());
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> removeFromWishlist(int productId) async {
    try {
      await _datasource.removeFromWishlist(productId);
      return const ApiResult.success(());
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
