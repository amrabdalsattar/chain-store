import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/reset_password_request_model.dart';

class ResetPasswordDataSource {
  final ApiHelper _apiHelper;
  const ResetPasswordDataSource(this._apiHelper);

  Future<void> forgetPassword(String email) async {
    await _apiHelper.post(
      ApiRequestModel(
        endPoint: ApiConstants.forgetPasswordEP,
        queries: {
          "email": email,
        },
      ),
    );
  }

  Future<void> verifyOtp(String email, String otp) async {
    await _apiHelper.post(ApiRequestModel(
      endPoint: ApiConstants.otpVerificationEP,
      body: {
        "email": email,
        "otp": otp,
      },
    ));
  }

  Future<void> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    await _apiHelper.put(
      ApiRequestModel(
        endPoint: ApiConstants.resetPasswordEP,
        body: resetPasswordRequestModel.toJson(),
      ),
    );
  }
}
