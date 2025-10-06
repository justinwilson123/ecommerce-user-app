class GetNotificationModel {
  int? notificationId;
  String? titleNotification;
  String? bodyNotification;
  int? userIdNotification;
  int? isRead;

  GetNotificationModel({
    this.notificationId,
    this.titleNotification,
    this.bodyNotification,
    this.userIdNotification,
    this.isRead,
  });

  GetNotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    titleNotification = json['title_notification'];
    bodyNotification = json['body_notification'];
    userIdNotification = json['user_id_notification'];
    isRead = json['is_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification_id'] = this.notificationId;
    data['title_notification'] = this.titleNotification;
    data['body_notification'] = this.bodyNotification;
    data['user_id_notification'] = this.userIdNotification;
    data['is_read'] = isRead;
    return data;
  }
}
