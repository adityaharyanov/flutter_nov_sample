import 'package:collection/collection.dart';
import 'package:get/state_manager.dart';

import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/domains/usecases/activity/activity.usecase.dart';
import 'package:flutter_nov_trial/helpers/datetime_ext.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_main.router.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_list_item.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_list_section.viewmodel.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

class ActivityMainViewModel extends RoutableViewModel<ActivityMainRouter> {
  final ActivityUseCase activityUseCase;

  var _activities = List<Activity>.empty(growable: true);

  var activityListSections =
      List<ActivityListSectionViewModel>.empty(growable: true).obs;

  ActivityMainViewModel({required this.activityUseCase});

  @override
  void onInit() {
    super.onInit();
    _loadActivityItems();
  }

  Future _loadActivityItems() async {
    _activities = await activityUseCase.fetchActivityList();
    var finalList = _mapToSectionViewModel(_activities);

    activityListSections.clear();
    activityListSections.addAll(finalList);
  }

  onTapActivityItem(Activity item) async {
    router.pushActivityDetail(item);
  }

  onTapCreateActivity() async {
    var success = await router.pushCreateActivty();

    if (success) {
      await _loadActivityItems();
    }
  }

  List<ActivityListSectionViewModel> _mapToSectionViewModel(
      List<Activity> value) {
    return _activities
        .groupListsBy((element) => element.datetime.date)
        .entries
        .sorted((b, a) => a.key.compareTo(b.key))
        .map((e) {
      return ActivityListSectionViewModel(
          transactionDate: e.key,
          currencySymbol: e.value[0].currency.symbol,
          totalIncome:
              _calculateAmount(type: ActivityType.income, items: e.value),
          totalExpense:
              _calculateAmount(type: ActivityType.expense, items: e.value),
          items: _mapToItemViewModel(e.value));
    }).toList();
  }

  double _calculateAmount(
      {required ActivityType type, required List<Activity> items}) {
    return items
        .where((element) => element.type == ActivityType.income)
        .map((e) => e.amount)
        .fold(0, (sum, item) => sum + item);
  }

  RxList<ActivityListItemViewModel> _mapToItemViewModel(List<Activity> value) {
    return value
        .sorted((b, a) => a.datetime.compareTo(b.datetime))
        .map((e) => ActivityListItemViewModel.fromModel(e))
        .toList()
        .obs;
  }
}
