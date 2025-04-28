import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/signup_request_model.dart';

class SignupDataSource {
  final ApiHelper _apiHelper;
  const SignupDataSource(this._apiHelper);

  Future<void> signup(SignupRequestModel signupRequestModel) async {
    await _apiHelper.post(ApiRequestModel(
      endPoint: ApiConstants.signUpEP,
      body: signupRequestModel.toJson(),
    ));
  }
}
