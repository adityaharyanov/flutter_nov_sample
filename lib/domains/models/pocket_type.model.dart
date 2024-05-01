enum PocketType {
  fund(id: 1, name: "Fund"),
  debt(id: 2, name: "Debt"),
  investment(id: 3, name: "Invest");

  const PocketType({required this.id, required this.name});

  factory PocketType.fromId(int id) {
    return PocketType.values.firstWhere((element) => element.id == id);
  }
  final int id;
  final String name;
}
