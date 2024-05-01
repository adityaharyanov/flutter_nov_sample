import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_nov_trial/presentation/pages/main/main.router.dart';
import 'package:flutter_nov_trial/router/route/account_route.dart';
import 'package:flutter_nov_trial/router/route/activity_route.dart';
import 'package:flutter_nov_trial/router/route/auth_route.dart';
import 'package:flutter_nov_trial/router/route/category_route.dart';
import 'package:flutter_nov_trial/router/route/home_route.dart';
import 'package:flutter_nov_trial/router/route/pocket_route.dart';

class AppRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  late GoRouter router;

  AppRouter() {
    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      // initialLocation: main.routePath,
      routes: [
        _mainRouter(),
        ...AccountRoute.routes,
        ...ActivityRoute.routes,
        ...AuthRoute.routes,
        ...HomeRoute.routes,
        ...PocketRoute.routes,
        ...CategoryRoute.routes,
      ],
    );
  }

  StatefulShellRoute _mainRouter() {
    var route = MainRouter();
    return StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return route.buildPage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [HomeRoute.homeMain()],
          ),
          StatefulShellBranch(
            routes: [ActivityRoute.activityMain()],
          ),
          StatefulShellBranch(
            routes: [PocketRoute.pocketMain()],
          ),
          StatefulShellBranch(
            routes: [AccountRoute.accountMain()],
          ),
        ]);
  }
}
