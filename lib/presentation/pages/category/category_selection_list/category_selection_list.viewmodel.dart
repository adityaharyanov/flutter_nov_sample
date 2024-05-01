import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:flutter_nov_trial/domains/models/category.model.dart';
import 'package:flutter_nov_trial/domains/usecases/category.usecase.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/create_activity/models/activity_source_destination.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/pages/category/category_selection_list/category_list.router.dart';
import 'package:flutter_nov_trial/presentation/pages/category/category_selection_list/models/category_item.viewmodel.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

class CategoryListViewModel extends RoutableViewModel<CategoryListRouter> {
  RxList<CategoryItemViewModel> categories = RxList<CategoryItemViewModel>();

  final CategoryUseCase _categoryUseCase;

  CategoryListViewModel({required CategoryUseCase categoryUseCase})
      : _categoryUseCase = categoryUseCase;

  @override
  void onReady() {
    super.onReady();
    _fetchCategories();
  }

  void _fetchCategories() async {
    var data = await _categoryUseCase.fetchCategoryList();
    data.sort((a, b) => (b.parent?.id ?? 0).compareTo(a.id));

    var items = data.map((e) => CategoryItemViewModel(
        image: e.image,
        name: e.name,
        isParent: e.isParent,
        theme: "",
        model: e));

    categories.clear();
    categories.addAll(items);
  }

  void onItemSelected(CategoryItemViewModel item) {
    router.back(item.model);
  }
}
