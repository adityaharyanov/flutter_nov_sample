import 'package:go_router/go_router.dart';
import 'package:flutter_nov_trial/presentation/pages/auth/forgot_password/forgot_password.router.dart';
import 'package:flutter_nov_trial/presentation/pages/auth/login/login.router.dart';
import 'package:flutter_nov_trial/presentation/pages/auth/register/register.router.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';

class AuthRoute {
  static List<GoRoute> get routes => [login(), register(), forgotPassword()];

  static GoRoute login() {
    var route = LoginRouter();
    return GoRoute(
      path: Routes.login.path,
      builder: (context, state) {
        return route.buildPage();
      },
    );
  }

  static GoRoute register() {
    var route = RegisterRouter();
    return GoRoute(
        path: Routes.register.path,
        builder: (context, state) {
          return route.buildPage();
        },
        routes: const []);
  }

  static GoRoute forgotPassword() {
    var route = ForgotPasswordRouter();
    return GoRoute(
        path: Routes.forgotPassword.path,
        builder: (context, state) {
          return route.buildPage();
        },
        routes: const []);
  }
}
