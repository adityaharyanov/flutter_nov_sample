import 'package:get/get.dart';

import 'package:flutter_nov_trial/data/repositories/pocket.repository.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';
import 'package:flutter_nov_trial/domains/usecases/pocket.usecase.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_detail/pocket_detail.page.dart';
import 'package:flutter_nov_trial/presentation/pages/pocket/pocket_detail/pocket_detail.viewmodel.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';
import 'package:flutter_nov_trial/router/navigator.dart';
import 'package:flutter_nov_trial/utils/global.dart';

class PocketDetailRouter with BaseNavigator {
  PocketDetailRouter();

  PocketDetailPage buildPage(Pocket model) {
    var dataProvider = Global.instance.dbService;
    var pocketRepository = PocketRepository(dataProvider: dataProvider);
    var pocketUseCase = PocketUseCase(pocketRepository: pocketRepository);
    var viewModel =
        PocketDetailViewModel(model: model, pocketUseCase: pocketUseCase);
    viewModel.setRouter(this);
    return PocketDetailPage(viewModel: Get.put(viewModel));
  }

  Future<Pocket?> pushCreatePocket({Pocket? model}) async {
    var pocket = await push<Pocket>(Routes.createPocket, extra: model);
    return pocket;
  }
}
