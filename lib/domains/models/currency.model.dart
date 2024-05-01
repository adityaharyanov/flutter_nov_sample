class Currency {
  int id;
  String code;
  String name;
  String symbol;
  String image;

  Currency({
    required this.id,
    required this.code,
    required this.name,
    required this.symbol,
    required this.image,
  });

  Currency.fromMap(Map<String, dynamic> map)
      : id = map['currency_id'],
        code = map['currency_code'],
        name = map['currency_name'],
        symbol = map['currency_symbol'],
        image = map['currency_image'];

  factory Currency.IDR({int id = 1}) {
    return Currency(
        id: id,
        code: "IDR",
        name: "Indonesian Rupiah",
        symbol: "Rp",
        image: "");
  }
}
