import 'package:flutter_nov_trial/data/repositories/activity.repository.dart';
import 'package:flutter_nov_trial/domains/models/activity.model.dart';

class ActivityUseCase {
  ActivityRepository activityRepository;

  ActivityUseCase({required this.activityRepository});

  Future<List<Activity>> fetchActivityList() {
    return activityRepository.fetchActivityList();
  }

  Future<bool> save(Activity data) {
    return activityRepository.save(data);
  }
}
