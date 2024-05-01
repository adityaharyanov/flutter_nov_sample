import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/helpers/datetime_ext.dart';
import 'package:flutter_nov_trial/helpers/datetime_formatter.dart';
import 'package:flutter_nov_trial/helpers/number_formatter.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_detail/activity_detail.router.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/create_activity/models/activity_source_destination.viewmodel.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

class ActivityDetailViewModel extends RoutableViewModel<ActivityDetailRouter> {
  late final Activity _model;

  String get currencySymbol => _model.currency.symbol;

  String get amount => _model.amount.toStringDecimal();

  String get sourceIconPath => "";

  String get sourceName => _model.sourceName;

  String get destinationIconPath => "";

  String get destinationName => _model.destinationName;

  String get notes => _model.notes ?? "";

  String get datetimeText =>
      _model.datetime.toStringFormat(DateTimeFormat.fullDateTime);

  ActivityEntityViewModel get source {
    return ActivityEntityViewModel.fromActivity(
        _model, ActivityFlowType.source);
  }

  ActivityEntityViewModel get destination {
    return ActivityEntityViewModel.fromActivity(
        _model, ActivityFlowType.destination);
  }

  ActivityDetailViewModel({required Activity model}) : _model = model;

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  void onTapEdit() async {
    var activity = await router.pushCreateActivity(data: _model);

    if (activity == null) {
      return;
    }
  }

  void onTapDelete() async {}
  void onTapFavorite() async {}
  void onTapDuplicate() async {}
}
