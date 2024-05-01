import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter_nov_trial/utils/routable_mixin.dart';
import 'package:flutter_nov_trial/utils/view.dart';

import 'package:flutter_nov_trial/utils/viewmodel.dart';

class ScaffoldPageObserver<VM extends RoutableViewModel>
    extends RoutableView<VM> {
  late final VM _viewModel;
  late final WidgetBuilder _contentWidgetBuilder;
  late final WidgetBuilder? _initialWidgetBuilder;
  late final WidgetBuilder? _loadingWidgetBuilder;
  late final WidgetBuilder? _emptyWidgetBuilder;
  late final WidgetBuilder? _errorWidgetBuilder;

  ScaffoldPageObserver(
      {required VM viewModel,
      required WidgetBuilder contentWidgetBuilder,
      WidgetBuilder? initialWidgetBuilder,
      WidgetBuilder? loadingWidgetBuilder,
      WidgetBuilder? emptyWidgetBuilder,
      WidgetBuilder? errorWidgetBuilder,
      super.key})
      : super(viewModel: viewModel) {
    _viewModel = viewModel;
    _contentWidgetBuilder = contentWidgetBuilder;
    _initialWidgetBuilder = initialWidgetBuilder;
    _loadingWidgetBuilder = loadingWidgetBuilder;
    _emptyWidgetBuilder = emptyWidgetBuilder;
    _errorWidgetBuilder = errorWidgetBuilder;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(
      () {
        switch (_viewModel.state.value) {
          case PageState.initial:
            if (_initialWidgetBuilder == null) return const SizedBox.shrink();
            return _initialWidgetBuilder!.call(context);
          case PageState.loading:
            if (_loadingWidgetBuilder == null) {
              throw Exception("Loading Widget not Found");
            }
            return _loadingWidgetBuilder!.call(context);
          case PageState.loaded:
            return _contentWidgetBuilder.call(context);
          case PageState.empty:
            if (_emptyWidgetBuilder == null) {
              throw Exception("Empty Widget not Found");
            }
            return _emptyWidgetBuilder!.call(context);
          case PageState.error:
            if (_errorWidgetBuilder == null) {
              throw Exception("Error Widget not Found");
            }
            return _errorWidgetBuilder!.call(context);
        }
      },
    );
  }
}
