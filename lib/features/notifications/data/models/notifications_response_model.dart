class NotificationResponseModel {
  final List<NotificationItemModel> notifications;
  final bool isSuccess;
  final int errorCode;
  final String message;

  NotificationResponseModel({
    required this.notifications,
    required this.isSuccess,
    required this.errorCode,
    required this.message,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      notifications: List<NotificationItemModel>.from(
        json['data'].map((item) => NotificationItemModel.fromJson(item)),
      ),
      isSuccess: json['isSuccess'],
      errorCode: json['errorCode'],
      message: json['message'],
    );
  }
}

class NotificationItemModel {
  final int id;
  final String title;
  final String body;
  final bool isRead;
  final String type;

  NotificationItemModel({
    required this.id,
    required this.title,
    required this.body,
    required this.isRead,
    required this.type,
  });

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) {
    return NotificationItemModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      isRead: json['isRead'],
      type: json['type'],
    );
  }
}
