import '../../../../core/helpers/token_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/customer_orders_response.dart';

class OrdersDatasource {
  final ApiHelper _apiHelper;
  const OrdersDatasource(this._apiHelper);

  Future<List<OrderDataModel>> getCustomerOrders() async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.getCustomerOrdersEP,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );

    final CustomerOrdersResponse customerOrdersResponse =
        CustomerOrdersResponse.fromJson(response);

    return customerOrdersResponse.orders;
  }
}
