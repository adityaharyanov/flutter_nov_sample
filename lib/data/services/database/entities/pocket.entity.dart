// tableName: m_pockets
class Pocket {
  int id;
  int currencyId;
  int iconId;
  int pocketTypeId;
  String name;
  String description;
  String createdAt;
  String modifiedAt;

  Pocket({
    required this.id,
    required this.currencyId,
    required this.iconId,
    required this.pocketTypeId,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.modifiedAt,
  });
}
