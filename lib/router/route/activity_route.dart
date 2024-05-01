import 'package:go_router/go_router.dart';
import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_detail/activity_detail.router.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_main.router.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/create_activity/create_activity.router.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';

class ActivityRoute {
  static List<GoRoute> get routes =>
      [activityMain(), _activityDetail(), _createActivity()];
  static GoRoute activityMain() {
    var route = ActivityMainRouter();
    return GoRoute(
        path: Routes.activityMain.path,
        builder: (context, state) {
          return route.buildPage();
        });
  }

  static GoRoute _activityDetail() {
    var route = ActivityDetailRouter();
    return GoRoute(
      path: Routes.activityDetail.path,
      builder: (context, state) {
        var model = (state.extra as Set).firstOrNull as Activity?;

        if (model == null) {
          throw Exception("Activity model is required");
        }

        return route.buildPage(model);
      },
    );
  }

  static GoRoute _createActivity() {
    var route = CreateActivityRouter();
    return GoRoute(
        path: Routes.createActivity.path,
        builder: (context, state) {
          return route.buildPage();
        });
  }
}
