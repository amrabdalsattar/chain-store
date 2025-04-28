import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasources/pre_login_datasource.dart';

class PreLoginRepo {
  final PreLoginDatasource _datasource;
  const PreLoginRepo(this._datasource);

  Future<ApiResult<void>> updateFCMToken(String fcmToken) async {
    try {
      await _datasource.updateFCMToken(fcmToken);
      return ApiResult.success(());
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
