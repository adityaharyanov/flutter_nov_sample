class CategoryEntity {
  int id;
  int parentId;
  String name;
  int iconId;
  String activityType;
  int createdAt;
  int modifiedAt;

  CategoryEntity({
    required this.id,
    required this.parentId,
    required this.name,
    required this.iconId,
    required this.activityType,
    required this.createdAt,
    required this.modifiedAt,
  });
}
