import 'package:get/get.dart';
import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/domains/models/category.model.dart';
import 'package:flutter_nov_trial/domains/models/currency.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';
import 'package:flutter_nov_trial/domains/usecases/activity/activity.usecase.dart';
import 'package:flutter_nov_trial/helpers/datetime_formatter.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/calculator/calculator.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/create_activity/create_activity.router.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/create_activity/models/activity_source_destination.viewmodel.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

class CreateActivityViewModel extends RoutableViewModel<CreateActivityRouter> {
  final ActivityUseCase activityUseCase;
  final CalculatorViewModel calculatorVM;

  late ActivityType activityType;

  RxString get output => calculatorVM.output.obs;

  late Currency currency;

  late Rx<DateTime> datetime;

  String get dateTimeText => DateTimeFormat.fullDateTime.format(datetime.value);

  late RxString notes;

  Category? _category;

  Pocket? _sourcePocket;

  Pocket? _destinationPocket;

  final Rx<ActivityEntityViewModel> _source = Rx<ActivityEntityViewModel>(
      ActivityEntityViewModel.empty(ActivityFlowType.source));
  Rx<ActivityEntityViewModel> get source {
    return _source;
  }

  void updateSource() {
    switch (activityType) {
      case ActivityType.income:
        _source.value = ActivityEntityViewModel.fromCategory(
            _category, ActivityFlowType.source);
      default:
        _source.value = ActivityEntityViewModel.fromPocket(
            _sourcePocket, ActivityFlowType.source);
    }
  }

  final Rx<ActivityEntityViewModel> _destination = Rx<ActivityEntityViewModel>(
      ActivityEntityViewModel.empty(ActivityFlowType.destination));
  Rx<ActivityEntityViewModel> get destination {
    return _destination;
  }

  String get currencySymbol => currency.symbol;

  CreateActivityViewModel(
      {required this.activityUseCase,
      required this.calculatorVM,
      required this.activityType,
      Activity? model}) {
    currency = model?.currency ?? Currency.IDR();
    datetime = (model?.datetime ?? DateTime.now()).obs;
    activityType = activityType;
    // output = model.amount.toStringDecimal();

    notes = (model?.notes ?? "").obs;
    _category = model?.category;
    _sourcePocket = model?.source;
    _destinationPocket = model?.destination;
  }

  Future createActivity() async {
    var activity = Activity(
      amount: 0,
      category: _category!,
      currency: currency,
      datetime: datetime.value,
      type: activityType,
      notes: notes.value,
      source: _sourcePocket,
      destination: _destinationPocket,
    );

    var isSaved = await activityUseCase.save(activity);

    if (!isSaved) {
      throw Exception();
    }
    router.popWithReturn(activity);
  }

  Future selectCategoryEntity() async {
    var selectedCategory = await router.pushCategoryListSelection();

    _category = selectedCategory;
  }

  Future selectPocketEntity(ActivityFlowType flowType) async {
    var selectedPocket = await router.pushPocketListSelection();
  }

  void selectActivityEntity({required ActivityFlowType flowType}) async {}

  void onTapDateTime() async {
    var result = await router.showDateTime(datetime.value);
    if (result != null) {
      datetime.value = result;
    }
  }

  @override
  void dispose() {}
}
