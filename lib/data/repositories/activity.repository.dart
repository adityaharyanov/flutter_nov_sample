import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/domains/models/category.model.dart';

class ActivityRepository {
  final ActivityDataService _dataProvider;

  ActivityRepository({required ActivityDataService dataProvider})
      : _dataProvider = dataProvider;

  Future<List<Activity>> fetchActivityList() async {
    var result = await _dataProvider.getAllActivities();

    return result.map((e) => Activity.fromMap(e)).toList();
  }

  Future<bool> save(Activity data) {
    return _dataProvider.insertActivity(data.toMap());
  }
}

abstract class ActivityDataService {
  Future<List<Map<String, Object?>>> getAllActivities({int page = 1});
  Future<bool> insertActivity(Map<String, Object?> data);
}
