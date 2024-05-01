import 'package:get/get.dart';

import 'package:flutter_nov_trial/data/repositories/activity.repository.dart';
import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/domains/models/category.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';
import 'package:flutter_nov_trial/domains/usecases/activity/activity.usecase.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/calculator/calculator.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/create_activity/create_activity.page.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/create_activity/create_activity.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/bottomsheet/datepicker_bottomsheet.widget.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/utils/global.dart';

class CreateActivityRouter with BaseNavigator {
  CreateActivityPage buildPage(
      {Activity? model, ActivityType type = ActivityType.income}) {
    var dataProvider = Global.instance.activityDataService;
    var activityRepository = ActivityRepository(dataProvider: dataProvider);

    var activityUseCase =
        ActivityUseCase(activityRepository: activityRepository);

    var calculatorVM = CalculatorViewModel(amount: model?.amount ?? 0);
    var viewModel = Get.put(CreateActivityViewModel(
        activityUseCase: activityUseCase,
        activityType: type,
        model: model,
        calculatorVM: calculatorVM));
    viewModel.setRouter(this);
    return CreateActivityPage(viewModel: viewModel);
  }

  Future<Category?> pushCategoryListSelection() async {
    return await push<Category>(Routes.categoryList);
  }

  Future<Pocket?> pushPocketListSelection() async {
    return await push<Pocket?>(Routes.pocketList);
  }

  Future<DateTime?> showDateTime(DateTime? value) async {
    var result = await pushBottomSheet<DateTime>(builder: (context) {
      return DatePickerBottomSheet(selectedDateTime: value);
    });

    return result;
  }

  void popWithReturn(Activity data) {
    return pop<Activity>(data);
  }
}
