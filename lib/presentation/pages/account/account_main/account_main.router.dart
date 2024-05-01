import 'package:flutter_nov_trial/presentation/pages/account/account_main/account_main.page.dart';
import 'package:flutter_nov_trial/presentation/pages/account/account_main/account_main.viewmodel.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';
import 'package:flutter_nov_trial/router/navigator.dart';

class AccountMainRouter with BaseNavigator {
  AccountMainPage buildPage() {
    var viewModel = AccountMainViewModel();
    viewModel.setRouter(this);
    return AccountMainPage(viewModel: viewModel);
  }

  pushSettings() {
    push(Routes.settings);
  }

  goLogin() {
    push(Routes.login);
  }
}
