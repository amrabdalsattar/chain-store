import '../../../../core/helpers/token_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/place_order_models/place_order_request_model.dart';

class PlaceOrderDatasource {
  final ApiHelper _apiHelper;
  PlaceOrderDatasource(this._apiHelper);
  Future<void> placeOrder(PlaceOrderRequestModel requestModel) async {
    await _apiHelper.post(
      ApiRequestModel(
        endPoint: ApiConstants.placeOrderEP,
        body: requestModel.toJson(),
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );
  }
}
