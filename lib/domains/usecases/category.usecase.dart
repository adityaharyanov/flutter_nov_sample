import 'package:flutter_nov_trial/data/repositories/category.repository.dart';
import 'package:flutter_nov_trial/domains/models/category.model.dart';

class CategoryUseCase {
  final CategoryRepository repository;

  CategoryUseCase({required this.repository});

  Future<List<Category>> fetchCategoryList() async {
    return repository.fetchCategoryList();
  }
}
