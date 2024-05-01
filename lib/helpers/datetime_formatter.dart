import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeFormat {
  static DateFormat get fullDateTime => DateFormat("EEEE, dd MMM yyyy HH:mm");
  static DateFormat get fullDate1Line => DateFormat("EEEE, dd MMM yyyy");
  static DateFormat get fullDate2Lines => DateFormat("EEEE\ndd MMM yyyy");
  static DateFormat get date => DateFormat("dd MMM yyyy");
  static DateFormat get day => DateFormat("EEEE");
  static DateFormat get time => DateFormat("HH:mm");
}
