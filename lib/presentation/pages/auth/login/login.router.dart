import 'package:flutter_nov_trial/presentation/pages/auth/forgot_password/forgot_password.router.dart';
import 'package:flutter_nov_trial/presentation/pages/auth/login/login.page.dart';
import 'package:flutter_nov_trial/presentation/pages/auth/login/login.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/auth/register/register.router.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/router/page_route.dart';

class LoginRouter with BaseNavigator {
  LoginRouter();

  LoginPage buildPage() {
    var viewModel = LoginViewModel();
    viewModel.setRouter(this);
    return LoginPage(viewModel: viewModel);
  }

  goRegister() {
    push(Routes.register);
  }

  goForgotPassword() {
    push(Routes.forgotPassword);
  }
}
