class ActivityPocketEntry {
  int id;
  String? type;
  int pocketId;
  int activityId;
  int amount;
  int startingBalance;
  int endingBalance;
  String createdAt;
  String modifiedAt;

  ActivityPocketEntry({
    required this.id,
    required this.type,
    required this.pocketId,
    required this.activityId,
    required this.amount,
    required this.startingBalance,
    required this.endingBalance,
    required this.createdAt,
    required this.modifiedAt,

  });

}