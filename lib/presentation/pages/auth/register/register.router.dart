import 'package:flutter_nov_trial/presentation/pages/auth/register/register.page.dart';
import 'package:flutter_nov_trial/presentation/pages/auth/register/register.viewmodel.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/router/page_route.dart';

class RegisterRouter with BaseNavigator {
  @override
  List<PageRoute2> routes = [];

  RegisterRouter();

  @override
  RegisterPage buildPage() {
    var viewModel = RegisterViewModel();
    viewModel.setRouter(this);
    return RegisterPage(viewModel: viewModel);
  }
}
