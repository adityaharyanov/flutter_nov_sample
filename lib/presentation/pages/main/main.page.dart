import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_nov_trial/router/app_router.dart';
import 'package:flutter_nov_trial/presentation/pages/account/account_main/account_main.router.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/activity_main/activity_main.router.dart';
import 'package:flutter_nov_trial/presentation/pages/home/home_main.page.dart';
import 'package:flutter_nov_trial/presentation/pages/home/home_main.router.dart';
import 'package:flutter_nov_trial/presentation/pages/main/main.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/main/tab_content_item.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_main/pocket_main.router.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/bottom_tab_bar.dart';
import 'package:flutter_nov_trial/utils/view.dart';

class MainPage extends RoutableView<MainViewModel> {
  final StatefulNavigationShell? navigationShell;

  // late final List<TabContentItem> tabContentItems = [
  //   TabContentItem(
  //     tab: const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
  //     content: viewModel.router.routes.homeMain.directPage,
  //   ),
  //   TabContentItem(
  //     tab: const NavigationDestination(
  //         icon: Icon(Icons.transfer_within_a_station), label: 'Activity'),
  //     content: viewModel.router.routes.activityMain.directPage,
  //   ),
  //   TabContentItem(
  //     tab: const NavigationDestination(
  //         icon: Icon(Icons.wallet), label: 'Pocket'),
  //     content: viewModel.router.routes.pocketMain.directPage,
  //   ),
  //   TabContentItem(
  //     tab: const NavigationDestination(
  //         icon: Icon(Icons.account_circle), label: 'Account'),
  //     content: viewModel.router.routes.accountMain.directPage,
  //   ),
  // ];

  late final List<TabContentItem> tabContentItems = [
    TabContentItem(
      tab: const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      content: HomeMainRouter().buildPage(),
    ),
    TabContentItem(
      tab: const BottomNavigationBarItem(
          icon: Icon(Icons.transfer_within_a_station), label: 'Activity'),
      content: ActivityMainRouter().buildPage(),
    ),
    TabContentItem(
      tab: const BottomNavigationBarItem(
          icon: Icon(Icons.wallet), label: 'Pocket'),
      content: PocketMainRouter().buildPage(),
    ),
    TabContentItem(
      tab: const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: 'Account'),
      content: AccountMainRouter().buildPage(),
    ),
  ];

  MainPage(this.navigationShell, {super.key, required super.viewModel});

  List<BottomNavigationBarItem> get tabs =>
      tabContentItems.map((o) => o.tab).toList();
  List<Widget> get contents => tabContentItems.map((o) => o.content).toList();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // return Obx(() {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell!.currentIndex,
        onTap: (index) {
          viewModel.selectedIndex = index;
          navigationShell!.goBranch(
            index,
            initialLocation: index == navigationShell!.currentIndex,
          );
        },
        items: tabs,
      ),
      // bottomNavigationBar: BottomTabBar(
      //     destinations: tabs,
      //     onDestinationSelected: (selectedIndex) =>
      //         viewModel.selectedIndex = selectedIndex),
      body: navigationShell,
    );
    // });
  }
}
