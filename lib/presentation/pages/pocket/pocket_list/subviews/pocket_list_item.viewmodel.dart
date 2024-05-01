import 'package:flutter_nov_trial/domains/models/pocket.model.dart';
import 'package:flutter_nov_trial/helpers/number_formatter.dart';

class PocketListItemViewModel {
  final String image;
  final String name;
  final String totalAmount;

  final Pocket model;

  PocketListItemViewModel._(
      {required this.image,
      required this.name,
      required this.totalAmount,
      required this.model});

  factory PocketListItemViewModel.fromModel({required Pocket model}) {
    return PocketListItemViewModel._(
        image: model.image,
        name: model.name,
        totalAmount: model.amountText,
        model: model);
  }
}
