import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

mixin Routable<R extends BaseNavigator> {
  late R _router;
  R get router => _router;

  setRouter(R router) {
    _router = router;
  }
}
