import 'package:get/get.dart';
import 'package:flutter_nov_trial/presentation/pages/main/main.router.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

class MainViewModel extends RoutableViewModel<MainRouter> {
  final RxInt _selectedIndex = 0.obs;

  int get selectedIndex {
    return _selectedIndex.value;
  }

  set selectedIndex(int value) {
    _selectedIndex.value = value;
  }

  MainViewModel();
}
