import 'package:flutter_nov_trial/domains/models/activity.model.dart';

class Category {
  late int id;
  Category? parent;
  late String name;
  late String image;
  late ActivityType type;
  bool get isParent => (parent == null);

  Category({
    required this.id,
    this.parent,
    required this.name,
    required this.image,
    required this.type,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parent =
        (json['parent'] == null) ? null : Category.fromJson(json['parent']);
    name = json['name'];
    image = json['imagePath'];
    type = ActivityType.values.firstWhere(
        (element) => element.name.toUpperCase() == json['activityType']);
  }

  Map<String, dynamic> toJson() {
    if (type == ActivityType.none) {
      throw Exception('Activity Type is not valid');
    }
    return {
      'id': id,
      'parent_id': parent?.id,
      'name': name,
      'icon_id': 1,
      'activityType': type.name,
    };
  }
}
