import 'package:flutter_nov_trial/presentation/pages/account/settings/settings.page.dart';
import 'package:flutter_nov_trial/presentation/pages/account/settings/settings.viewmodel.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/router/page_route.dart';

class SettingsRouter with BaseNavigator {
  @override
  List<PageRoute2> routes = [];

  SettingsRouter();

  @override
  SettingsPage buildPage() {
    var viewModel = SettingsViewModel();
    viewModel.setRouter(this);
    return SettingsPage(viewModel: viewModel);
  }
}
