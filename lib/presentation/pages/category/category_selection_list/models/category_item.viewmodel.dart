import 'package:flutter_nov_trial/domains/models/category.model.dart';

class CategoryItemViewModel {
  String image;
  String name;
  bool isParent;
  String theme;
  Category model;

  CategoryItemViewModel({
    required this.image,
    required this.name,
    required this.isParent,
    required this.theme,
    required this.model,
  });
}
