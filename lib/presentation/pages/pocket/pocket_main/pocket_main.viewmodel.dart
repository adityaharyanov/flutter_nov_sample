import 'package:collection/collection.dart';
import 'package:get/get_rx/get_rx.dart';

import 'package:flutter_nov_trial/domains/models/currency.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket_type.model.dart';
import 'package:flutter_nov_trial/domains/usecases/pocket.usecase.dart';
import 'package:flutter_nov_trial/helpers/number_formatter.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_list/pocket_list.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_main/pocket_main.router.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

class PocketMainViewModel extends RoutableViewModel<PocketMainRouter> {
  late final PocketUseCase _pocketUseCase;

  Currency currency = Currency.IDR();

  Rx<PocketType> selectedType = PocketType.fund.obs;

  double get totalBalance => pocketMaps.values
      .whereNot((e) => e.type == PocketType.debt)
      .map((e) => e.totalAmount)
      .fold(0, (a, b) => a + b);

  String get totalBalanceText =>
      "${currency.symbol} ${totalBalance.toStringDecimal()}";

  late RxMap<PocketType, PocketListViewModel> _pocketMaps;

  set pocketMaps(Map<PocketType, PocketListViewModel> map) {
    for (var e in map.entries) {
      pocketMaps[e.key] = e.value;
    }
  }

  RxMap<PocketType, PocketListViewModel> get pocketMaps {
    return _pocketMaps;
  }

  PocketMainViewModel({required PocketUseCase pocketUseCase}) {
    _pocketUseCase = pocketUseCase;
    _pocketMaps = RxMap<PocketType, PocketListViewModel>.of({
      PocketType.fund: PocketListViewModel(
          pockets: [], type: PocketType.fund, parentVM: this),
      PocketType.debt: PocketListViewModel(
          pockets: [], type: PocketType.debt, parentVM: this),
      PocketType.investment: PocketListViewModel(
          pockets: [], type: PocketType.investment, parentVM: this)
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await _fetchPocketList();
  }

  void changeListSection(PocketType type) {
    selectedType.value = type;
  }

  Future _fetchPocketList() async {
    // state.value = PageState.loading;
    var pockets = await _pocketUseCase.fetchAllPockets();

    var finalList = pockets.groupListsBy((e) => e.type).map((k, v) {
      return MapEntry(
          k, PocketListViewModel(pockets: v, type: k, parentVM: this));
    });

    pocketMaps = finalList;
    // state.value = PageState.loaded;
  }

  Future createNewPocket() async {
    var pocket = await router.openCreatePocket();
    if (pocket == null) return;

    await _fetchPocketList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
