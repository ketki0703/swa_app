import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  static DateTime now = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime(now.year, now.month, now.day + 1).toLocal();
  DateTime lastDate = DateTime(now.year + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 117, 68),
      body: Padding(
        padding: const EdgeInsets.only(top: 80, bottom: 20),
        child: Center(
          child: Column(children: [
            Text(
              "Period in ",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "6 days ",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            TableCalendar(
              calendarStyle: const CalendarStyle(
                canMarkersOverflow: false,
                isTodayHighlighted: false,
                selectedDecoration: BoxDecoration(
                    color: const Color(0xffCF0303), shape: BoxShape.circle),
                rangeEndDecoration: BoxDecoration(
                    color: const Color(0xffCF0303), shape: BoxShape.circle),
                rangeStartDecoration: BoxDecoration(
                    color: const Color(0xffCF0303), shape: BoxShape.circle),
                outsideDaysVisible: false,
                rangeHighlightColor: Color.fromARGB(255, 240, 232, 166),
              ),
              focusedDay: focusedDay,
              firstDay: focusedDay,
              rangeStartDay: focusedDay,
              rangeEndDay: selectedDay,
              lastDay: DateTime(now.year + 1),
              onDaySelected: (DateTime selectDay, DateTime focDate) {
                setState(() {
                  selectedDay = selectDay;
                  // focusedDay = focDate;
                });
                print('focused date: - $focusedDay');
                print('selected date:- $selectedDay');
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
            ),
          ]),
        ),
      ),
    );
  }
}
