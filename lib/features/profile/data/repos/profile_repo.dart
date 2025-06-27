import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/profile_datasource.dart';
import '../models/customer_profile_response_model.dart';
import '../models/update_profile_request_model.dart';

class ProfileRepo {
  final ProfileDatasource _datasource;
  const ProfileRepo(this._datasource);

  Future<ApiResult<CustomerData>> getCustomerProfile() async {
    try {
      final result = await _datasource.getCustomerProfile();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> updateCustomerProfile(
    UpdateProfileRequest customerProfileRequest,
  ) async {
    try {
      await _datasource.updateCustomerProfile(customerProfileRequest);
      return const ApiResult.success(());
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
