import '../../../../core/helpers/token_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/wishlist_response.dart';

class WishlistDatasource {
  final ApiHelper _apiHelper;
  const WishlistDatasource(this._apiHelper);

  Future<List<WishlistProductModel>> getWishlistItems() async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.getWishlistItemsEP,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );

    final WishlistResponse wishlistResponse = WishlistResponse.fromJson(
      response,
    );
    return wishlistResponse.wishlistProducts;
  }

  Future<void> addToWishlist(int productId) async {
    await _apiHelper.post(
      ApiRequestModel(
        endPoint: ApiConstants.addToWishlistEP,
        queries: {'productId': productId},
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );
  }

  Future<void> removeFromWishlist(int productId) async {
    await _apiHelper.delete(
      ApiRequestModel(
        endPoint: ApiConstants.removeFromWishlistEP,
        queries: {'productId': productId},
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );
  }
}
