import 'dart:math';

import 'package:flutter_nov_trial/data/repositories/activity.repository.dart';
import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/domains/models/category.model.dart';
import 'package:flutter_nov_trial/domains/models/currency.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket_type.model.dart';

class ActivityMemoryDataService implements ActivityDataService {
  List<Activity> activities = List<Activity>.empty(growable: true);

  static Activity dummy() {
    return _createIncomeActivity(DateTime.now());
  }

  ActivityMemoryDataService() {
    _seed();
  }

  @override
  Future<List<Map<String, Object?>>> getAllActivities({int page = 1}) {
    return Future.delayed(const Duration(seconds: 1),
        () => activities.map((e) => e.toMap()).toList());
  }

  @override
  Future<bool> insertActivity(Map<String, Object?> data) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        var activity = Activity.fromMap(data);
        activities.add(activity);
        return true;
      },
    );
  }

  void _seed() {
    for (var i = 0; i < 5; i++) {
      var num = Random().nextInt(10);

      if (num % 2 == 0) {
        activities.add(_createExpenseActivity(_getToday()));
      } else {
        activities.add(_createIncomeActivity(_getToday()));
      }
    }

    for (var i = 0; i < 3; i++) {
      var num = Random().nextInt(10);

      if (num % 2 == 0) {
        activities.add(_createExpenseActivity(_getYesterday()));
      } else {
        activities.add(_createIncomeActivity(_getYesterday()));
      }
    }

    for (var i = 0; i < 7; i++) {
      var num = Random().nextInt(10);

      if (num % 2 == 0) {
        activities.add(_createExpenseActivity(_getOther()));
      } else {
        activities.add(_createIncomeActivity(_getOther()));
      }
    }
  }

  Activity _createExpenseActivity(DateTime datetime) {
    return Activity(
        id: _getId(),
        amount: (Random().nextDouble() + 1) * 1000,
        type: ActivityType.expense,
        source: _getPocket(),
        category: Category(
          id: _getId(),
          image: "",
          name: "Entertainment",
          type: ActivityType.expense,
        ),
        currency: _getCurrency(),
        datetime: datetime);
  }

  static Activity _createIncomeActivity(DateTime datetime) {
    return Activity(
        id: _getId(),
        amount: (Random().nextDouble() + 1) * 1000,
        type: ActivityType.income,
        destination: _getPocket(),
        category: Category(
          id: _getId(),
          image: "",
          name: "Salary",
          type: ActivityType.income,
        ),
        currency: _getCurrency(),
        datetime: datetime);
  }

  static Pocket _getPocket() {
    return Pocket(
        image: "",
        name: "Cash",
        id: 1,
        currency: _getCurrency(),
        amount: 1500000,
        type: PocketType.fund,
        createdAt: DateTime.now());
  }

  static int _getId() {
    return (Random().nextInt(200) + 1);
  }

  DateTime _getToday() {
    return DateTime.now().subtract(Duration(
        hours: Random().nextInt(3) + 2, minutes: Random().nextInt(40) + 10));
  }

  DateTime _getYesterday() {
    return DateTime.now().subtract(Duration(
        days: 1,
        hours: Random().nextInt(10) + 2,
        minutes: Random().nextInt(40) + 10));
  }

  DateTime _getOther() {
    return DateTime.now().subtract(Duration(
        days: 3,
        hours: Random().nextInt(10) + 2,
        minutes: Random().nextInt(40) + 10));
  }

  static Currency _getCurrency() {
    return Currency.IDR(id: _getId());
  }
}
