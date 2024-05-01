import 'package:flutter_nov_trial/domains/models/category.model.dart';
import 'package:flutter_nov_trial/domains/models/currency.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';

class Activity {
  int? id;
  DateTime datetime;
  Category category;
  Currency currency;
  double amount;
  Pocket? source;
  Pocket? destination;
  String? notes;
  ActivityType type;

  String get sourceName {
    switch (type) {
      case ActivityType.income:
        return category.name;
      default:
        return source?.name ?? "N/A";
    }
  }

  String get destinationName {
    switch (type) {
      case ActivityType.expense:
        return category.name;
      default:
        return destination?.name ?? "N/A";
    }
  }

  Activity({
    this.id,
    required this.datetime,
    required this.type,
    required this.category,
    required this.currency,
    required this.amount,
    this.source,
    this.destination,
    this.notes,
  });

  Activity.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        datetime = DateTime.parse(map['datetime']),
        type = ActivityType.values[map['type']],
        category = Category.fromJson(map['category']),
        currency = Currency.fromMap(map['currency']),
        amount = map['amount'],
        source = map['source'] != null ? Pocket.fromMap(map['source']) : null,
        destination = map['destination'] != null
            ? Pocket.fromMap(map['destination'])
            : null,
        notes = map['notes'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'datetime': datetime.toIso8601String(),
      'category_id': category.id,
      'currency_id': currency.id,
      'activity_type': type.name,
      'amount': amount,
      'source_pocket_id': source?.id,
      'destination_pocket_id': destination?.id,
      'additional_notes': notes,
      'modified_at': DateTime.now().toIso8601String(),
    };
  }
}

enum ActivityType {
  income,
  expense,
  transfer,
  none;
}
