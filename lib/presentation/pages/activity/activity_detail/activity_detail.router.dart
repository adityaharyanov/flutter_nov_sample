import 'package:flutter/material.dart';

import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_detail/activity_detail.page.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_detail/activity_detail.viewmodel.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/router/page_route.dart';

class ActivityDetailRouter with BaseNavigator {
  ActivityDetailRouter();

  Widget buildPage(Activity model) {
    var viewModel = ActivityDetailViewModel(model: model);
    viewModel.setRouter(this);
    return ActivityDetailPage(
      viewModel: viewModel,
    );
  }

  Future<Activity?> pushCreateActivity({Activity? data}) async {
    var activity = await push<Activity>(Routes.createActivity, extra: data);
    return activity;
  }
}
