import 'package:go_router/go_router.dart';
import 'package:flutter_nov_trial/presentation/pages/home/home_main.router.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';

class HomeRoute {
  static List<GoRoute> get routes => [homeMain()];
  static GoRoute homeMain() {
    var route = HomeMainRouter();
    return GoRoute(
      path: Routes.homeMain.path,
      builder: (context, state) {
        return route.buildPage();
      },
    );
  }
}
