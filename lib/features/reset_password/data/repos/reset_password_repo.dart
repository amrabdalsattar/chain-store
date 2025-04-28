import '../../../../core/helpers/constant_string.dart';
import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/reset_password_data_source.dart';
import '../models/reset_password_request_model.dart';

class ResetPasswordRepo {
  final ResetPasswordDataSource _dataSource;
  const ResetPasswordRepo(this._dataSource);

  Future<ApiResult<String>> forgetPassword(String email) async {
    try {
      await _dataSource.forgetPassword(email);
      return const ApiResult.success(ConstantString.otpSentMessage);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<String>> verifyOtp(
      {required String email, required String otp}) async {
    try {
      await _dataSource.verifyOtp(email, otp);
      return const ApiResult.success(ConstantString.otpVerified);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<String>> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    try {
      await _dataSource.resetPassword(resetPasswordRequestModel);
      return const ApiResult.success(ConstantString.passwordResetMessage);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
