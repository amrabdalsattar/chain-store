import '../../../../core/helpers/constant_string.dart';
import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/signup_data_source.dart';
import '../models/signup_request_model.dart';

class SignupRepo {
  final SignupDataSource _signupDataSource;
  const SignupRepo(this._signupDataSource);

  Future<ApiResult<String>> signup(
      SignupRequestModel signupRequestModel) async {
    try {
      await _signupDataSource.signup(signupRequestModel);
      return const ApiResult.success(
          ConstantString.emailConfirmationSuccessMessage);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
