import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_nov_trial/data/repositories/pocket.repository.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';
import 'package:flutter_nov_trial/domains/usecases/pocket.usecase.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_main/pocket_main.page.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_main/pocket_main.viewmodel.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/utils/global.dart';
import 'package:flutter_nov_trial/router/page_route.dart';

class PocketMainRouter with BaseNavigator {
  PocketMainPage buildPage() {
    var dataProvider = Global.instance.dbService;
    var pocketRepository = PocketRepository(dataProvider: dataProvider);
    var pocketUseCase = PocketUseCase(pocketRepository: pocketRepository);
    var viewModel = PocketMainViewModel(pocketUseCase: pocketUseCase);
    viewModel.setRouter(this);

    return PocketMainPage(viewModel: Get.put(viewModel));
  }

  Future<Pocket?> openCreatePocket() async {
    var result = await push<Pocket>(Routes.login);
    return result;
  }

  Future pushPocketDetail(Pocket model) {
    return push(Routes.pocketDetail, extra: model);
  }
}
