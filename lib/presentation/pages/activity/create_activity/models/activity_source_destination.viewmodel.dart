import 'package:flutter/material.dart';
import 'package:flutter_nov_trial/domains/models/activity.model.dart';
import 'package:flutter_nov_trial/domains/models/category.model.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';

class ActivityEntityViewModel {
  IconData image;
  String name;
  ActivityFlowType activityFlowType;
  ActivityEntityType activityEntityType;
  String get titleLabel =>
      "${activityFlowType.label} ${activityEntityType.label}";

  ActivityEntityViewModel._(
      {this.image = Icons.wallet,
      required this.name,
      required this.activityFlowType,
      required this.activityEntityType});

  factory ActivityEntityViewModel.fromCategory(
      Category? category, ActivityFlowType activityFlowType) {
    if (category == null) {
      return ActivityEntityViewModel.empty(activityFlowType);
    }
    return ActivityEntityViewModel._(
      image: Icons.cameraswitch,
      name: category.name,
      activityFlowType: activityFlowType,
      activityEntityType: ActivityEntityType.category,
    );
  }

  factory ActivityEntityViewModel.fromPocket(
      Pocket? pocket, ActivityFlowType activityFlowType) {
    if (pocket == null) {
      return ActivityEntityViewModel.empty(activityFlowType);
    }
    return ActivityEntityViewModel._(
      image: Icons.cameraswitch,
      name: pocket.name,
      activityFlowType: activityFlowType,
      activityEntityType: ActivityEntityType.category,
    );
  }

  factory ActivityEntityViewModel.empty(ActivityFlowType activityFlowType) {
    return ActivityEntityViewModel._(
      image: Icons.cameraswitch,
      name: "N/A",
      activityFlowType: activityFlowType,
      activityEntityType: ActivityEntityType.none,
    );
  }

  factory ActivityEntityViewModel.fromActivity(
      Activity activity, ActivityFlowType activityFlowType) {
    switch (activityFlowType) {
      case ActivityFlowType.source:
        switch (activity.type) {
          case ActivityType.income:
            return ActivityEntityViewModel.fromCategory(
                activity.category, activityFlowType);
          default:
            if (activity.source != null) {
              return ActivityEntityViewModel.fromPocket(
                  activity.source!, activityFlowType);
            } else {
              return ActivityEntityViewModel.empty(activityFlowType);
            }
        }
      case ActivityFlowType.destination:
        switch (activity.type) {
          case ActivityType.expense:
            return ActivityEntityViewModel.fromCategory(
                activity.category, activityFlowType);
          default:
            if (activity.source != null) {
              return ActivityEntityViewModel.fromPocket(
                  activity.destination!, activityFlowType);
            } else {
              return ActivityEntityViewModel.empty(activityFlowType);
            }
        }
    }
  }
}

enum ActivityFlowType {
  source,
  destination;

  String get label {
    switch (this) {
      case ActivityFlowType.source:
        return "From";
      case ActivityFlowType.destination:
        return "To";
    }
  }
}

enum ActivityEntityType {
  none,
  category,
  pocket;

  String get label {
    switch (this) {
      case ActivityEntityType.category:
        return "Category";
      case ActivityEntityType.pocket:
        return "Pocket";
      default:
        return "N/A";
    }
  }
}
