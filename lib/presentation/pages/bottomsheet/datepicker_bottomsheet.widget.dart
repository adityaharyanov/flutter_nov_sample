import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:intl/intl.dart';
import 'package:flutter_nov_trial/helpers/datetime_ext.dart';
import 'package:flutter_nov_trial/helpers/datetime_formatter.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/icon_text_outlined_button.widget.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/outlined_button.widget.dart';
import 'package:flutter_nov_trial/presentation/widgets/atoms/wrapped_bottomsheet.widget.dart';
import 'package:flutter_nov_trial/presentation/widgets/styles/text_styles.style.dart';
import 'package:flutter_nov_trial/router/navigator.dart';

class DatePickerBottomSheet extends StatefulWidget {
  final DateTime? _selectedDateTime;

  const DatePickerBottomSheet({DateTime? selectedDateTime, super.key})
      : _selectedDateTime = selectedDateTime;

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet>
    with BaseNavigator {
  final DateTime today = DateTime.now();
  final DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
  late DateTime selectedDateTime;
  TimeOfDay time = TimeOfDay.now();
  DateTime? custom;

  set setSelectedDateTime(DateTime dateTime) {
    selectedDateTime = dateTime;

    if (!dateTime.isEqualDate(today) && !dateTime.isEqualDate(yesterday)) {
      custom = DateTime(dateTime.year, dateTime.month, dateTime.day);
    }

    time = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  _DatePickerBottomSheetState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget._selectedDateTime != null) {
      setSelectedDateTime = widget._selectedDateTime!;
    } else {
      setSelectedDateTime = today;
    }
  }

  bool _isSelected({DateTime? datetime}) {
    if (datetime == null) return false;
    return selectedDateTime.isEqualDate(datetime);
  }

  void _onDateSelected(
      BuildContext context, DateTime selectedDate, TimeOfDay selectedTime) {
    var selectedDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
      0,
    );

    pop(selectedDateTime);
  }

  void _onTapCustomDate(BuildContext context) async {
    custom = await _openDateCalendar(context, custom);

    if (context.mounted) {
      _onDateSelected(context, custom!, time);
    }
  }

  void _onTapTime(BuildContext context) async {
    custom = await _openDateCalendar(context, custom);

    if (context.mounted) {
      _onDateSelected(context, custom!, time);
    }
  }

  Future<DateTime?> _openDateCalendar(
      BuildContext context, DateTime? selectedDate) async {
    final date = await showDatePickerDialog(
      context: context,
      minDate: DateTime(1900, 1, 1),
      maxDate: DateTime.now(),
      currentDate: (selectedDate == null) ? DateTime.now() : selectedDate,
    );

    return date;
  }

  Future<DateTime?> _openTimePicker(
      BuildContext context, TimeOfDay selectedTime) async {
    TimeOfDay timeOfDay = await showDialog(
        context: context,
        builder: (context) {
          return TimePickerDialog(
            initialTime: time,
            hourLabelText: "Hour",
            minuteLabelText: "Minute",
            initialEntryMode: TimePickerEntryMode.dialOnly,
          );
        });

    setState(() {
      time = timeOfDay;
    });

    if (context.mounted) {
      _onDateSelected(context, selectedDateTime, time);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    context = context;
    return WrappedBottomSheet(
        title: "Datepicker",
        content: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          child: Column(
            children: [
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date",
                    style: TextStyles.textStyle1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 95,
                    child: Row(
                      children: [
                        Expanded(
                          child: MainOutlinedButton(
                            topText: "Yesterday",
                            bottomText:
                                DateTimeFormat.fullDate2Lines.format(yesterday),
                            isSelected: _isSelected(datetime: yesterday),
                            onTap: () =>
                                _onDateSelected(context, yesterday, time),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: MainOutlinedButton(
                            topText: "Today",
                            bottomText:
                                DateTimeFormat.fullDate2Lines.format(today),
                            isSelected: _isSelected(datetime: today),
                            onTap: () => _onDateSelected(context, today, time),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 50,
                    child: IconTextOutlinedButton(
                      icon: Icons.calendar_month,
                      text: (custom == null)
                          ? "Select custom date"
                          : DateTimeFormat.fullDate1Line.format(custom!),
                      isSelected: _isSelected(datetime: custom),
                      onTap: () => _onTapCustomDate(context),
                    ),
                  ),
                ],
              )),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Time",
                      style: TextStyles.textStyle1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: IconTextOutlinedButton(
                        icon: Icons.calendar_month,
                        text: DateTimeFormat.time.format(
                            DateFormat("hh:mm a").parse(time.format(context))),
                        isSelected: true,
                        onTap: () => _openTimePicker(context, time),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
