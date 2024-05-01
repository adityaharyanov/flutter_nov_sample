class Activity {
  int id;
  String datetime;
  int categoryId;
  String activityType;
  int currencyId;
  int amount;
  int sourcePocketId;
  int destinationPocketId;
  String? additionalNote;
  int attachmentId;
  int recurrenceId;
  String? createdAt;
  String? modifiedAt;

  Activity({
    required this.id,
    required this.datetime,
    required this.categoryId,
    required this.activityType,
    required this.currencyId,
    required this.amount,
    required this.sourcePocketId,
    required this.destinationPocketId,
    required this.additionalNote,
    required this.attachmentId,
    required this.recurrenceId,
    required this.createdAt,
    required this.modifiedAt,
  });

  static String schema() {
    return """
      CREATE TABLE "activities" (
        "id" INTEGER NOT NULL,
        "datetime" text NOT NULL,
        "category_id" INTEGER NOT NULL,
        "activity_type" TEXT NOT NULL,
        "currency_id" INTEGER NOT NULL,
        "amount" integer NOT NULL,
        "source_pocket_id" integer,
        "destination_pocket_id" INTEGER,
        "additional_note" TEXT,
        "attachment_id" INTEGER,
        "recurrence_id" INTEGER,
        "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "modified_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY ("id")
      );
    """;
  }
}