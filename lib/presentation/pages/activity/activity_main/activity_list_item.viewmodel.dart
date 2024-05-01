import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/helpers/datetime_ext.dart';
import 'package:flutter_nov_trial/helpers/datetime_formatter.dart';
import 'package:flutter_nov_trial/helpers/number_formatter.dart';

class ActivityListItemViewModel {
  final String iconPath;
  final String sourceIconPath;
  final String sourceName;
  final String destinationIconPath;
  final String destinationName;
  final String notes;
  final String amount;
  final String time;

  final Activity model;

  ActivityListItemViewModel({
    required this.iconPath,
    required this.sourceIconPath,
    required this.sourceName,
    required this.destinationIconPath,
    required this.destinationName,
    required this.notes,
    required this.amount,
    required this.time,
    required this.model,
  });

  factory ActivityListItemViewModel.fromModel(Activity model) {
    return ActivityListItemViewModel(
        amount: "${model.currency.symbol} ${model.amount.toStringDecimal()}",
        sourceIconPath: "",
        destinationIconPath: "",
        sourceName: model.sourceName,
        destinationName: model.destinationName,
        iconPath: "",
        notes: model.notes ?? "",
        time: model.datetime.toStringFormat(DateTimeFormat.time),
        model: model);
  }
}
