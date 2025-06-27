import '../../../../core/helpers/token_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/customer_profile_response_model.dart';
import '../models/update_profile_request_model.dart';

class ProfileDatasource {
  final ApiHelper _apiHelper;
  const ProfileDatasource(this._apiHelper);

  Future<CustomerData> getCustomerProfile() async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.getCustomerProfileEP,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );

    final CustomerProfileResponse customerProfileResponse =
        CustomerProfileResponse.fromJson(response);
    return customerProfileResponse.customer;
  }

  Future<void> updateCustomerProfile(
    UpdateProfileRequest customerProfileRequest,
  ) async {
    await _apiHelper.put(
      ApiRequestModel(
        endPoint: ApiConstants.updateCustomerProfileEP,
        body: customerProfileRequest.toJson(),
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );
  }
}
