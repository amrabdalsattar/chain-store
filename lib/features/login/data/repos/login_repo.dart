import 'package:flutter/foundation.dart';

import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/login_datasource.dart';
import '../models/login_response_model.dart';

class LoginRepo {
  final LoginDatasource _loginDatasource;
  const LoginRepo(this._loginDatasource);
  Future<ApiResult<LoginResponseModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var result = await _loginDatasource.login(
        email: email,
        password: password,
      );
      return ApiResult.success(result);
    } catch (error) {
      debugPrint('The error is $error');
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
