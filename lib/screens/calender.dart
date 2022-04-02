import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  // late Future<int> _startYear;
  // late Future<int> _startMonth;
  // late Future<int> _startDate;
  int dummy = 0;

  Future<void> checkDaysLeft(DateTime selectedDate) async {
    //
    final SharedPreferences sharedPref = await _pref;
    int startDate = sharedPref.getInt('startDate') ?? 1;
    int startMonth = sharedPref.getInt('startMonth') ?? 05;
    int startYear = sharedPref.getInt('startYear') ?? 2022;
    setState(() {
      dummy = DateTime(startYear, startMonth, startDate)
          .difference(selectedDate)
          .inDays;
    });
  }

  Future<void> setInitialDummyValue() async {
    incrementStartDateMonth();
    final SharedPreferences sharedPref = await _pref;
    int startDate = sharedPref.getInt('startDate') ?? 1;
    int startMonth = sharedPref.getInt('startMonth') ?? 05;
    int startYear = sharedPref.getInt('startYear') ?? 2022;
    setState(() {
      dummy = DateTime(startYear, startMonth, startDate)
          .difference(DateTime.now())
          .inDays;
    });
  }

  Future<void> incrementStartDateMonth() async {
    final SharedPreferences sharedPref = await _pref;
    int startDate = sharedPref.getInt('startDate') ?? 1;
    int startMonth = sharedPref.getInt('startMonth') ?? 5;
    if (startDate == DateTime.now().day) {
      if (startMonth == DateTime.now().month) {
        sharedPref.setInt('startMonth', startMonth + 1);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setInitialDummyValue();
  }

  static DateTime now = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime(now.year, now.month, now.day).toLocal();
  DateTime lastDate = DateTime(now.year + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 117, 68),
      body: Padding(
        padding: const EdgeInsets.only(top: 80, bottom: 20),
        child: Center(
          child: Column(children: [
            const Text(
              "Period in ",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "$dummy days ",
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            TableCalendar(
              calendarStyle: const CalendarStyle(
                canMarkersOverflow: false,
                isTodayHighlighted: false,
                selectedDecoration: BoxDecoration(
                    color: Color(0xffCF0303), shape: BoxShape.circle),
                rangeEndDecoration: BoxDecoration(
                    color: Color(0xffCF0303), shape: BoxShape.circle),
                rangeStartDecoration: BoxDecoration(
                    color: Color(0xffCF0303), shape: BoxShape.circle),
                outsideDaysVisible: false,
                // rangeHighlightColor: Color.fromARGB(255, 240, 232, 166),
              ),
              focusedDay: focusedDay,
              firstDay: focusedDay,
              rangeStartDay: focusedDay,
              // rangeEndDay: selectedDay,
              lastDay: DateTime(now.year + 1),
              onDaySelected: (DateTime selectDay, DateTime focDate) {
                setState(() {
                  selectedDay = selectDay;
                  // focusedDay = focDate;
                });
                checkDaysLeft(selectedDay);
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
