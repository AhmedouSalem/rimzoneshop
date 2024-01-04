class NotificationsModel {
  int? notificationId;
  String? notificationTitle;
  String? notificationBody;
  String? notificationDateTime;
  int? notificationUsers;

  NotificationsModel({
    this.notificationId,
    this.notificationTitle,
    this.notificationBody,
    this.notificationDateTime,
    this.notificationUsers,
  });

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationDateTime = json['notification_datetime'];
    notificationUsers = json['notification_users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification_id'] = notificationId;
    data['notification_title'] = notificationTitle;
    data['notification_body'] = notificationBody;
    data['notification_datetime'] = notificationDateTime;
    data['notification_users'] = notificationUsers;
    return data;
  }
}
