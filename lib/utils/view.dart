import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';

abstract class BaseView<VM extends BaseViewModel> extends GetView<VM> {
  // final bool _isViewLoaded = false;
  late final VM viewModel;
  late BuildContext context;
  late MediaQueryData media;

  BaseView({required this.viewModel, super.key});

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    this.context = context;
    media = MediaQuery.of(context);

    // if (!_isViewLoaded) {
    //   _isViewLoaded = true;
    //   viewModel.on();
    // }

    return const Placeholder();
  }
}

abstract class RoutableView<VM extends RoutableViewModel> extends GetView<VM> {
  // final bool _isViewLoaded = false;
  late final VM viewModel;
  late BuildContext context;
  late MediaQueryData media;

  RoutableView({required this.viewModel, super.key});

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    this.context = context;
    viewModel.router.context = context;
    media = MediaQuery.of(context);

    // if (!_isViewLoaded) {
    //   _isViewLoaded = true;
    //   viewModel.on();
    // }

    return const Placeholder();
  }
}
