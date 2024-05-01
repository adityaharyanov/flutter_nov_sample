import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_nov_trial/presentation/pages/home/home_main.page.dart';
import 'package:flutter_nov_trial/presentation/pages/home/home_main.viewmodel.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/router/page_route.dart';

class HomeMainRouter with BaseNavigator {
  @override
  Widget buildPage() {
    var viewModel = HomeMainViewModel();
    viewModel.setRouter(this);
    return HomeMainPage(viewModel: viewModel);
  }
}
