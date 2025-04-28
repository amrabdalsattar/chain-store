import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../datasources/notifications_datasource.dart';
import '../models/notifications_response_model.dart';

class NotificationsRepo {
  final NotificationsDatasource _datasource;
  const NotificationsRepo(this._datasource);

  Future<ApiResult<List<NotificationItemModel>>> getNotifications() async {
    try {
      final result = await _datasource.getNotifications();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
