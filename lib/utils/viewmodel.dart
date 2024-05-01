import 'package:get/state_manager.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/utils/routable_mixin.dart';

enum PageState { initial, loading, loaded, empty, error }

abstract class BaseViewModel extends GetxController {
  Rx<PageState> state = PageState.loaded.obs;
}

abstract class RoutableViewModel<R extends BaseNavigator> extends BaseViewModel
    with Routable<R> {}
