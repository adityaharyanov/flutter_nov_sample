import 'package:intl/intl.dart';

extension DoubleFormatter on double {
  String toStringDecimal() {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    var format = NumberFormat.decimalPatternDigits();
    return format.format(this);
  }
}

extension IntFormatter on int {
  String toStringDecimal() {
    var format = NumberFormat.decimalPatternDigits();
    return format.format(this);
  }
}
