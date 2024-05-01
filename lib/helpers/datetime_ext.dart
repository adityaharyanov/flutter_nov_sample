import 'package:intl/intl.dart';

extension DateOnlyCompare on DateTime {
  bool isEqualDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isEqualTime(DateTime other) {
    return hour == other.hour &&
        minute == other.minute &&
        second == other.second;
  }

  String toStringFormat(DateFormat format) {
    return format.format(this);
  }

  DateTime get date {
    return DateTime(year, month, day);
  }

  DateTime get yesterday {
    return subtract(const Duration(days: 1));
  }
}
