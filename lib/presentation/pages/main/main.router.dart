import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_nov_trial/presentation/pages/account/account_main/account_main.router.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_main.router.dart';
import 'package:flutter_nov_trial/presentation/pages/home/home_main.router.dart';
import 'package:flutter_nov_trial/presentation/pages/main/main.page.dart';
import 'package:flutter_nov_trial/presentation/pages/main/main.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_main/pocket_main.router.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/router/page_route.dart';

class MainRouter with BaseNavigator {
  @override
  var routes = <BaseNavigator>[
    HomeMainRouter(),
    ActivityMainRouter(),
    PocketMainRouter(),
    AccountMainRouter(),
  ];

  Widget buildPage({required StatefulNavigationShell navigationShell}) {
    var viewModel = MainViewModel();
    viewModel.setRouter(this);
    return MainPage(
      navigationShell,
      viewModel: Get.put(viewModel),
    );
  }
}
