import '../../../core/helpers/token_helper.dart';
import '../../../core/networking/api_constants.dart';
import '../../../core/networking/api_helper.dart';
import '../../../core/networking/api_request_model.dart';
import '../data/models/notifications_response_model.dart';

class NotificationsDatasource {
  final ApiHelper _apiHelper;
  const NotificationsDatasource(this._apiHelper);

  Future<List<NotificationItemModel>> getNotifications() async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.getNotificationsEP,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );

    NotificationResponseModel notificationResponseModel =
        NotificationResponseModel.fromJson(response);

    return notificationResponseModel.notifications;
  }
}
