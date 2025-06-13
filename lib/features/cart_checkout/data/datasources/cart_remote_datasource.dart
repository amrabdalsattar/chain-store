import '../../../../core/helpers/token_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/cart_response_model.dart';

class CartRemoteDatasource {
  final ApiHelper _apiHelper;
  const CartRemoteDatasource(this._apiHelper);

  Future<CartInfo?> getCartInfo() async {
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
    return cartResponseModel.cartInfo;
  }
}
