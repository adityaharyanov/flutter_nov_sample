import 'package:flutter_nov_trial/presentation/pages/auth/forgot_password/forgot_password.page.dart';
import 'package:flutter_nov_trial/presentation/pages/auth/forgot_password/forgot_password.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/auth/login/login.page.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/router/page_route.dart';

class ForgotPasswordRouter with BaseNavigator {
  @override
  List<PageRoute2> routes = [];

  ForgotPasswordRouter();

  @override
  ForgotPasswordPage buildPage() {
    var viewModel = ForgotPasswordViewModel();
    viewModel.setRouter(this);
    return ForgotPasswordPage(viewModel: viewModel);
  }
}
