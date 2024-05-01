import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket_type.model.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_list/subviews/pocket_list_item.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_main/pocket_main.viewmodel.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

class PocketListViewModel extends BaseViewModel {
  late PocketMainViewModel parentVM;
  late RxList<PocketListItemViewModel> pockets;
  late PocketType type;

  String get title {
    switch (type) {
      case PocketType.fund:
        return "Fund Pocket";
      case PocketType.debt:
        return "Debt Pocket";
      case PocketType.investment:
        return "Investment Pocket";
    }
  }

  double get totalAmount =>
      pockets.map((e) => e.model.amount).fold(0, (sum, item) => sum + item);

  int get pocketCount => pockets.length;

  PocketListViewModel(
      {required List<Pocket> pockets,
      required this.type,
      required this.parentVM}) {
    this.pockets = RxList.of(pockets
        .map((e) => PocketListItemViewModel.fromModel(model: e))
        .toList());
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
