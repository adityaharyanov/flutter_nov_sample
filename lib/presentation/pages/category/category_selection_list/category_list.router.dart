import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_nov_trial/data/repositories/category.repository.dart';
import 'package:flutter_nov_trial/domains/models/category.model.dart';
import 'package:flutter_nov_trial/domains/usecases/category.usecase.dart';
import 'package:flutter_nov_trial/presentation/pages/category/category_selection_list/category_list.page.dart';
import 'package:flutter_nov_trial/presentation/pages/category/category_selection_list/category_selection_list.viewmodel.dart';
import 'package:flutter_nov_trial/router/navigator.dart';

class CategoryListRouter with BaseNavigator {
  CategoryListRouter();

  CategoryListPage buildPage() {
    var repository = CategoryRepository();
    var useCase = CategoryUseCase(repository: repository);
    var viewModel = CategoryListViewModel(categoryUseCase: useCase);
    viewModel.setRouter(this);

    return CategoryListPage(viewModel: Get.put(viewModel));
  }

  back(Category data) {
    pop<Category>(data);
  }
}
