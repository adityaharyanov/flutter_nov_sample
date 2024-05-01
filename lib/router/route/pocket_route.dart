import 'package:go_router/go_router.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_detail/pocket_detail.router.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_main/pocket_main.router.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';

class PocketRoute {
  static List<GoRoute> get routes => [pocketMain(), pocketDetail()];

  static GoRoute pocketMain() {
    var route = PocketMainRouter();
    return GoRoute(
        path: Routes.pocketMain.path,
        builder: (context, state) {
          return route.buildPage();
        });
  }

  static GoRoute pocketDetail() {
    var route = PocketDetailRouter();
    return GoRoute(
      path: Routes.pocketDetail.path,
      builder: (context, state) {
        var model = state.extra as Pocket?;

        if (model == null) {
          throw Exception("Activity model is required");
        }

        return route.buildPage(model);
      },
    );
  }
}
