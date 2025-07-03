import '../../../../core/helpers/token_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/cart_response_model.dart';

class CartRemoteDatasource {
  final ApiHelper _apiHelper;
  const CartRemoteDatasource(this._apiHelper);

  Future<CartInfo> getCartInfo() async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.getCartItemsEP,

        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );

    final CartResponseModel cartResponseModel = CartResponseModel.fromJson(
      response,
    );

    return cartResponseModel.cartInfo!;
  }

  Future<void> addToCart(int productId, int quantity) async {
    await _apiHelper.post(
      ApiRequestModel(
        endPoint: ApiConstants.addToCartEP,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
        body: {'productId': productId, 'quantity': quantity},
      ),
    );
  }

  Future<void> removeFromCart(int itemId) async {
    await _apiHelper.delete(
      ApiRequestModel(
        endPoint: ApiConstants.removeFromCartEP,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
        queries: {'itemId': itemId},
      ),
    );
  }

  Future<void> incrementCartItem(int itemId) async {
    await _apiHelper.put(
      ApiRequestModel(
        endPoint: ApiConstants.incrementCartItem,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
        queries: {'itemId': itemId},
      ),
    );
  }

  Future<void> decrementCartItem(int itemId) async {
    await _apiHelper.put(
      ApiRequestModel(
        endPoint: ApiConstants.decrementCartItem,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
        queries: {'itemId': itemId},
      ),
    );
  }
}
