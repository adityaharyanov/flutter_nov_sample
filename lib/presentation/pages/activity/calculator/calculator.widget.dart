import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter_nov_trial/presentation/pages/activity/calculator/calculator.viewmodel.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/text_button.dart';

class CalculatorWidget extends StatelessWidget {
  late final CalculatorViewModel _viewModel;
  final crossAxisCount = 32;
  final Function() onTapDateTime;
  final Function() onTapRecurrence;
  final Function() onTapSave;

  CalculatorWidget(
      {required CalculatorViewModel viewModel,
      required this.onTapDateTime,
      required this.onTapRecurrence,
      required this.onTapSave,
      super.key}) {
    _viewModel = viewModel;
  }

  Widget _createKey(Keypad key, int crossAxisCellCount, int mainAxisCellCount,
      void Function(Keypad) onTap) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount,
      child: MainTextButton(
        label: key.label,
        onPressed: () => onTap(key),
      ),
    );
  }

  List<Widget> _createCalculatorKeys() {
    int crossCellCount = 6;
    int crossCellCount2 = 8;
    int mainCellCount = 5;

    var largeKeypads = [
      Keypad.datetime,
      Keypad.recurrence,
      Keypad.backspace,
      Keypad.finish,
      Keypad.equal
    ];

    Map<Keypad, Function(Keypad)> keypadMap = {
      Keypad.num7: (e) => _viewModel.onKeypadChange(e),
      Keypad.num8: (e) => _viewModel.onKeypadChange(e),
      Keypad.num9: (e) => _viewModel.onKeypadChange(e),
      Keypad.charMinus: (e) => _viewModel.onKeypadChange(e),
      Keypad.datetime: (e) => onTapDateTime(),
      Keypad.num4: (e) => _viewModel.onKeypadChange(e),
      Keypad.num5: (e) => _viewModel.onKeypadChange(e),
      Keypad.num6: (e) => _viewModel.onKeypadChange(e),
      Keypad.charPlus: (e) => _viewModel.onKeypadChange(e),
      Keypad.recurrence: (e) => onTapRecurrence(),
      Keypad.num1: (e) => _viewModel.onKeypadChange(e),
      Keypad.num2: (e) => _viewModel.onKeypadChange(e),
      Keypad.num3: (e) => _viewModel.onKeypadChange(e),
      Keypad.charMulti: (e) => _viewModel.onKeypadChange(e),
      Keypad.backspace: (e) => _viewModel.onKeypadChange(e),
      Keypad.charDot: (e) => _viewModel.onKeypadChange(e),
      Keypad.num0: (e) => _viewModel.onKeypadChange(e),
      Keypad.num000: (e) => _viewModel.onKeypadChange(e),
      Keypad.charDiv: (e) => _viewModel.onKeypadChange(e),
    };

    if (_viewModel.isOuputContainsOperator) {
      keypadMap[Keypad.equal] = (e) => _viewModel.onKeypadChange(e);
    } else {
      keypadMap[Keypad.finish] = (key) => onTapSave();
    }

    var widgets = keypadMap.entries
        .map((e) => _createKey(
            e.key,
            largeKeypads.contains(e.key) ? crossCellCount2 : crossCellCount,
            mainCellCount,
            e.value))
        .toList();
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: StaggeredGrid.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: _createCalculatorKeys(),
        ),
      );
    });
  }
}
