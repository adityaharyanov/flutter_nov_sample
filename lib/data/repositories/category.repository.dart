import 'dart:convert';

import 'package:flutter_nov_trial/domains/models/category.model.dart';
import 'package:flutter/services.dart' show rootBundle;

class CategoryRepository {
  Future<List<Category>> fetchCategoryList() async {
    var path = 'assets/json/m_categories.json';
    var raw = await rootBundle.loadString(path);
    List<dynamic> decoded = json.decode(raw);

    return decoded.map((e) => Category.fromJson(e)).toList();
  }
}
