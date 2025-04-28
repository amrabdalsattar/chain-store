import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/notifications_repo.dart';
import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _repo;
  NotificationsCubit(this._repo) : super(NotificationsLoadingState()) {
    getNotifications();
  }

  void getNotifications() async {
    final result = await _repo.getNotifications();

    result.when(success: (notifications) {
      if (!isClosed) emit(NotificationsSuccessState(notifications));
    }, failure: (apiErrorModel) {
      if (!isClosed) emit(NotificationsErrorState(apiErrorModel));
    });
  }
}
