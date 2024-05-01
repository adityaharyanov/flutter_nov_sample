import 'package:flutter_nov_trial/domains/models/currency.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket_type.model.dart';
import 'package:flutter_nov_trial/helpers/number_formatter.dart';

class Pocket {
  int id;
  String name;
  String image;
  Currency currency;
  double amount;
  String description;
  PocketType type;
  DateTime createdAt;

  String get amountText => "${currency.symbol} ${amount.toStringDecimal()}";

  Pocket({
    required this.image,
    required this.name,
    required this.id,
    required this.currency,
    required this.amount,
    this.description = "",
    required this.type,
    required this.createdAt,
  });

  Pocket.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'] ?? "",
        image = map['icon_id'].toString(),
        currency = Currency.IDR(), //Currency.fromMap(map),
        amount = (map['amount'] as int).toDouble(),
        description = map['description'] ?? "",
        type = PocketType.fund,
        createdAt = DateTime.parse(map['created_at']);

  Map<String, dynamic> toMap() {
    var data = {
      'currency_id': currency.id,
      'icon_id': 1,
      'pocket_type_id': type.id,
      'name': name,
      'description': description,
      'amount': amount,
      'created_at': createdAt.toIso8601String(),
      'modified_at': DateTime.now().toIso8601String(),
    };

    if (id != -1) {
      data['id'] = id;
    }
    return data;
  }
}
