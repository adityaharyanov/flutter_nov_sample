import 'package:go_router/go_router.dart';
import 'package:flutter_nov_trial/presentation/pages/category/category_selection_list/category_list.router.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';

class CategoryRoute {
  static List<GoRoute> get routes => [categoryList()];

  static GoRoute categoryList() {
    var route = CategoryListRouter();
    return GoRoute(
      path: Routes.categoryList.path,
      builder: (context, state) {
        return route.buildPage();
      },
      routes: const [],
    );
  }
}
