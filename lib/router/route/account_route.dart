import 'package:go_router/go_router.dart';
import 'package:flutter_nov_trial/presentation/pages/account/account_main/account_main.router.dart';
import 'package:flutter_nov_trial/presentation/pages/account/settings/settings.router.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';

class AccountRoute {
  static List<GoRoute> get routes => [
        accountMain(),
        settings(),
      ];
  static GoRoute accountMain() {
    var route = AccountMainRouter();
    return GoRoute(
      path: Routes.accountMain.path,
      builder: (context, state) {
        return route.buildPage();
      },
    );
  }

  static GoRoute settings() {
    var route = SettingsRouter();
    return GoRoute(
      path: Routes.settings.path,
      builder: (context, state) {
        return route.buildPage();
      },
    );
  }
}
