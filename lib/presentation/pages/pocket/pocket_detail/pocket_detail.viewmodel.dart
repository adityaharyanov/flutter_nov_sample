import 'package:get/get.dart';
import 'package:flutter_nov_trial/domains/models/currency.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket_type.model.dart';
import 'package:flutter_nov_trial/domains/usecases/pocket.usecase.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_detail/pocket_detail.router.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

class PocketDetailViewModel extends RoutableViewModel<PocketDetailRouter> {
  late Pocket _model;
  late PocketUseCase _pocketUseCase;

  String get name => _model.name;
  String get image => _model.image;
  Currency get currency => _model.currency;
  double get amount => _model.amount;
  String get description => _model.description;
  PocketType get type => _model.type;

  PocketDetailViewModel(
      {required PocketUseCase pocketUseCase, required Pocket model}) {
    _model = model;
    _pocketUseCase = pocketUseCase;
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  onTapEdit() async {
    var pocket = await router.pushCreatePocket();

    if (pocket == null) {
      return;
    }
  }
}
