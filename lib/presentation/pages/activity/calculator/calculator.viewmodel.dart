import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:math_expressions/math_expressions.dart';

import 'package:flutter_nov_trial/helpers/number_formatter.dart';

class CalculatorViewModel {
  String zero = "0";

  var operators = [
    Keypad.charPlus.label,
    Keypad.charMinus.label,
    Keypad.charMulti.label,
    Keypad.charDiv.label
  ];

  late Function() onTapDateTime;
  late Function() onTapRecurrence;
  late Function() onTapSave;

  late RxList<String> outputComponent = RxList.of([]);

  double get value {
    var cleansedOutput = output.replaceAll(",", "");
    return double.tryParse(cleansedOutput) ?? 0;
  }

  String get output => outputComponent.join();

  set appendLastComponent(String component) {
    outputComponent[outputComponent.length - 1] += component;
  }

  set setLastComponent(String component) {
    outputComponent[outputComponent.length - 1] = component;
  }

  bool get isOuputContainsOperator => operators.any(
        (element) {
          return output.contains(element);
        },
      );

  CalculatorViewModel({double amount = 0}) {
    outputComponent.clear();
    outputComponent.add(amount.toStringDecimal());
    _formatNumberComponent();
  }

  void onKeypadChange(Keypad key) {
    switch (key) {
      case Keypad.num1:
        _numpad("1");
        break;
      case Keypad.num2:
        _numpad("2");
        break;
      case Keypad.num3:
        _numpad("3");
        break;
      case Keypad.num4:
        _numpad("4");
        break;
      case Keypad.num5:
        _numpad("5");
        break;
      case Keypad.num6:
        _numpad("6");
        break;
      case Keypad.num7:
        _numpad("7");
        break;
      case Keypad.num8:
        _numpad("8");
        break;
      case Keypad.num9:
        _numpad("9");
        break;
      case Keypad.num0:
        _numpad("0");
        break;
      case Keypad.num000:
        _numpad("000");
        break;
      case Keypad.charDot:
        _decimal();
        break;
      case Keypad.charPlus:
        _charpad("+");
        break;
      case Keypad.charMinus:
        _charpad("-");
        break;
      case Keypad.charMulti:
        _charpad("×");
        break;
      case Keypad.charDiv:
        _charpad("÷");
        break;
      case Keypad.backspace:
        _backspace();
        break;
      case Keypad.finish:
        onTapSave();
        break;
      case Keypad.equal:
        _equal();
        break;
      case Keypad.datetime:
        onTapDateTime();
        break;
      case Keypad.recurrence:
        onTapRecurrence();
        break;
    }

    _formatNumberComponent();
  }

  void _formatNumberComponent() {
    var splited = outputComponent.last;

    if (splited.endsWith(Keypad.charDot.label)) return;
    if (!operators.contains(splited)) {
      splited = splited.replaceAll(',', '');
      // splited = splited.replaceAll('.', ',');
      var result = double.tryParse(splited);

      if (result != null) {
        setLastComponent = result.toStringDecimal();
      }
    }
  }

  void _decimal() {
    var last = outputComponent.last;
    if (operators.contains(last)) {
      outputComponent.add("0.");
    } else if (!operators.contains(last) && !last.contains(".")) {
      appendLastComponent = ".";
    }
  }

  void _numpad(String num) {
    var last = outputComponent.last;
    if (operators.contains(last)) {
      outputComponent.add(num);
    } else {
      if (last == zero) {
        setLastComponent = num;
      } else {
        if (last.contains(Keypad.charDot.label)) {
          if (num == Keypad.num000.label) {
            return;
          }
          if (num == Keypad.num0.label) {
            return;
          }
        }
        appendLastComponent = num;
      }
    }
  }

  void _charpad(String char) {
    if (outputComponent.isEmpty) {
      return;
    }

    var last = outputComponent.last;
    if (!operators.contains(last) &&
        !(outputComponent.length == 1 && last == zero)) {
      outputComponent.add(char);
    }
  }

  void _backspace() {
    if (outputComponent.isEmpty) {
      return;
    }
    var last = outputComponent.last;

    if (outputComponent.length == 1 && last == zero) {
      return;
    }

    setLastComponent = last.substring(0, last.length - 1);

    if (outputComponent.last.isEmpty) {
      if (outputComponent.length < 2) {
        setLastComponent = zero;
      } else {
        outputComponent.removeAt(outputComponent.length - 1);
      }
    }
  }

  void _equal() {
    var expression = output.replaceAll(Keypad.charMulti.label, '*');
    expression = expression.replaceAll(Keypad.charDiv.label, '/');
    expression = expression.replaceAll(',', '');
    // expression = expression.replaceAll('.', ',');

    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);

      ContextModel cm = ContextModel();
      var result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      // if (result.toString().contains(Keypad.charDot.label)) {
      //   _formatNumberComponent();
      // }
      outputComponent.clear();
      outputComponent.add(result);

      _formatNumberComponent();
    } catch (e) {
      print(e);
    }
  }
}

enum Keypad {
  num1(label: "1"),
  num2(label: "2"),
  num3(label: "3"),
  num4(label: "4"),
  num5(label: "5"),
  num6(label: "6"),
  num7(label: "7"),
  num8(label: "8"),
  num9(label: "9"),
  num0(label: "0"),
  num000(label: "000"),
  charDot(label: "."),
  charPlus(label: "+"),
  charMinus(label: "-"),
  charMulti(label: "×"),
  charDiv(label: "÷"),
  backspace(label: "BS"),
  datetime(label: "Today"),
  equal(label: "="),
  finish(label: "V"),
  recurrence(label: "Recurrence");

  const Keypad({required this.label});

  final String label;
}
