import '../../../../core/networking/api_error_handler/api_error_model.dart';
import '../../data/models/notifications_response_model.dart';

sealed class NotificationsState {
  const NotificationsState();
}

class NotificationsLoadingState extends NotificationsState {
  const NotificationsLoadingState();
}

class NotificationsSuccessState extends NotificationsState {
  final List<NotificationItemModel>? notifications;
  const NotificationsSuccessState(this.notifications);
}

class NotificationsErrorState extends NotificationsState {
  final ApiErrorModel apiErrorModel;
  const NotificationsErrorState(this.apiErrorModel);
}
