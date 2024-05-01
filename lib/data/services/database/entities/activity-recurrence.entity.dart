class ActivityRecurrence {
  int id;
  int activityId;
  String startDate;
  int intervalDigit;
  String intervalUnit;
  bool enableNotification;
  int notificationIntervalDigit;
  String notificationIntervalUnit;
  String createdAt;
  String modifiedAt;

  ActivityRecurrence({
    required this.id,
    required this.activityId,
    required this.startDate,
    required this.intervalDigit,
    required this.intervalUnit,
    required this.enableNotification,
    required this.notificationIntervalDigit,
    required this.notificationIntervalUnit,
    required this.createdAt,
    required this.modifiedAt,
  });
}