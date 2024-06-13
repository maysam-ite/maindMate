import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/main.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 10, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateSelector(
          selectedDate: selectedDate,
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
        TimeSelector(
          selectedTime: selectedTime,
          onTimeSelected: (time) {
            setState(() {
              selectedTime = time;
            });
          },
        ),
      ].divide(const SizedBox(
        height: 40,
      )),
    );
  }
}

class DateSelector extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  DateSelector({required this.selectedDate, required this.onDateSelected});

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime _currentWeekStart = DateTime.now();

  @override
  void initState() {
    super.initState();
    _currentWeekStart = _findWeekStart(DateTime.now());
  }

  DateTime _findWeekStart(DateTime date) {
    int dayOfWeek = date.weekday;
    return date.subtract(Duration(days: dayOfWeek - 1));
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = List.generate(
        7, (index) => _currentWeekStart.add(Duration(days: index)));

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Image.asset('assets/images/play-button-r.png'),
              onTap: () {
                setState(() {
                  _currentWeekStart =
                      _currentWeekStart.subtract(const Duration(days: 7));
                });
              },
            ),
            Text(
              '${DateFormat('dd/MM/yyyy').format(_currentWeekStart)} ',
              style: const TextStyle(fontSize: 15),
            ),
            GestureDetector(
              child: Image.asset('assets/images/play-button-l.png'),
              onTap: () {
                setState(() {
                  _currentWeekStart =
                      _currentWeekStart.add(const Duration(days: 7));
                });
              },
            )
          ].divide(const SizedBox(
            width: 5,
          )),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            itemBuilder: (context, index) {
              DateTime date = dates[index];
              bool isSelected = date.day == widget.selectedDate.day &&
                  date.month == widget.selectedDate.month &&
                  date.year == widget.selectedDate.year;
              return GestureDetector(
                onTap: () => widget.onDateSelected(date),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.purple : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? Colors.purple
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateFormat('EEE', 'ar').format(date)),
                        SizedBox(
                          width: 30,
                          child: Divider(
                            color: appTheme.primaryText,
                          ),
                        ),
                        Text(date.day.toString()),
                      ]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TimeSelector extends StatelessWidget {
  final TimeOfDay selectedTime;
  final Function(TimeOfDay) onTimeSelected;

  TimeSelector({required this.selectedTime, required this.onTimeSelected});

  @override
  Widget build(BuildContext context) {
    List<TimeOfDay> times = [
      const TimeOfDay(hour: 8, minute: 0),
      const TimeOfDay(hour: 8, minute: 30),
      const TimeOfDay(hour: 9, minute: 0),
      const TimeOfDay(hour: 9, minute: 30),
      const TimeOfDay(hour: 10, minute: 0),
      const TimeOfDay(hour: 10, minute: 30),
    ];

    return Column(
      children: [
        const Text('اختر وقت', style: TextStyle(fontSize: 16)),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: times.map((time) {
            bool isSelected = time == selectedTime;
            return GestureDetector(
              onTap: () => onTimeSelected(time),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.purple : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: isSelected ? Colors.purple : Colors.grey),
                ),
                child: Text(time.format(context)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
