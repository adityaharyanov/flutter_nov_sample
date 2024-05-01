class AccountProfile {
  int id;
  String email;
  String? phoneNumber;
  String? avatarUrl;
  String firstName;
  String? lastName;
  int? subscribtionId;
  String? birthday;
  String createdAt;
  String modifiedAt;

  AccountProfile({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.avatarUrl,
    required this.firstName,
    required this.lastName,
    required this.subscribtionId,
    required this.birthday,
    required this.createdAt,
    required this.modifiedAt,
  });

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "email": email,
      "phone_number": phoneNumber,
      "avatar_url": avatarUrl,
      "first_name": firstName,
      "last_name": lastName,
      "subscribtion_id": subscribtionId,
      "birthday": birthday,
    };
  }

  static String schema() {
    return """
    CREATE TABLE "account_profile" (
      "id" INTEGER NOT NULL,
      "email" TEXT NOT NULL,
      "phone_number" INTEGER,
      "avatar_url" TEXT,
      "first_name" TEXT NOT NULL,
      "last_name" TEXT,
      "subscribtion_id" INTEGER,
      "birthday" TEXT,
      "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
      "modified_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY ("id")
    );
    """;
  }
}