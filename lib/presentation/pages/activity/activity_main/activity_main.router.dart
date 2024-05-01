import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';
import 'package:flutter_nov_trial/data/repositories/activity.repository.dart';
import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/domains/usecases/activity/activity.usecase.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_main.page.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_main.viewmodel.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/utils/global.dart';
import 'package:flutter_nov_trial/router/page_route.dart';

class ActivityMainRouter with BaseNavigator {
  Widget buildPage() {
    var dataProvider = Global.instance.activityDataService;
    var activityRepository = ActivityRepository(dataProvider: dataProvider);
    var activityUseCase =
        ActivityUseCase(activityRepository: activityRepository);
    var viewModel = ActivityMainViewModel(activityUseCase: activityUseCase);
    viewModel.setRouter(this);
    return ActivityMainPage(viewModel: Get.put(viewModel));
  }

  pushActivityDetail(Activity? selectedItem) async {
    push(Routes.activityDetail, extra: {selectedItem});
  }

  Future<bool> pushCreateActivty() async {
    var activity = await push<Activity>(Routes.createActivity);

    if (activity == null) return false;

    return true;
  }
}
