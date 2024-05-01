import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/helpers/datetime_ext.dart';
import 'package:flutter_nov_trial/helpers/datetime_formatter.dart';
import 'package:flutter_nov_trial/helpers/number_formatter.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_list_item.viewmodel.dart';

// part 'activity_list_section.viewmodel.g.dart';

// class ActivityListSectionViewModel = _ActivityListSectionViewModel
//     with _$ActivityListSectionViewModel;

class ActivityListSectionViewModel {
  late String date;
  late String day;
  late String totalIncome;
  late String totalExpense;

  var items = RxList<ActivityListItemViewModel>();

  ActivityListSectionViewModel(
      {required DateTime transactionDate,
      required String currencySymbol,
      required double totalIncome,
      required double totalExpense,
      required this.items}) {

    if (transactionDate.date == DateTime.now().date) {
      day = "";
      date = "Today";
    } else if (transactionDate.date == DateTime.now().yesterday) {
      day = "";
      date = "Yesterday";
    } else {
      day = transactionDate.toStringFormat(DateTimeFormat.day);
      date = transactionDate.toStringFormat(DateTimeFormat.date);
    }

    this.totalIncome = "$currencySymbol ${totalIncome.toStringDecimal()}";
    this.totalExpense = "$currencySymbol ${totalExpense.toStringDecimal()}";

    // activityItems.addAll([
    //   ActivityListItemViewModel(),
    //   ActivityListItemViewModel(),
    //   ActivityListItemViewModel(),
    //   ActivityListItemViewModel(),
    //   ActivityListItemViewModel(),
    // ]);
  }

  void add(Activity model) {
    var item = ActivityListItemViewModel.fromModel(model);

    items.add(item);
  }
}
