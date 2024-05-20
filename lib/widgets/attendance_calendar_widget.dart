import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../mock_api.dart';
import 'fading_line_seperator.dart'; // Ensure you import the mock API

class AttendanceCalendarWidget extends StatefulWidget {
  @override
  _AttendanceCalendarWidgetState createState() => _AttendanceCalendarWidgetState();
}

class _AttendanceCalendarWidgetState extends State<AttendanceCalendarWidget> {
  late Map<DateTime, bool> _attendanceData;
  late List<Map<String, dynamic>> _mockAttendanceData;

  @override
  void initState() {
    super.initState();
    _mockAttendanceData = getMockAttendanceData();
    _attendanceData = _convertToMap(_mockAttendanceData);
  }

  Map<DateTime, bool> _convertToMap(List<Map<String, dynamic>> data) {
    Map<DateTime, bool> map = {};
    for (var entry in data) {
      DateTime date = DateTime.parse(entry['date']);

      map[date] = entry['condition'];
    }
    return map;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 10, // Blur radius
            offset: Offset(0, 3), // Offset in x and y direction
          ),
        ],
        color: Colors.white,

        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: DateTime.now(),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  DateTime normalizedDate = DateTime(day.year, day.month, day.day);
                  print(_attendanceData.keys);
                  print(day);
                  if (_attendanceData.containsKey(day)) {
                    bool isPresent = _attendanceData[day]!;
                    print(_attendanceData.keys);
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isPresent ? Colors.green : Colors.red,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                        color: isPresent ? Colors.green : Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  } else {
                    return null;
                  }
                },
              ),
            ),
           const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0),
              child: FadingLineSeperator(),
            ),
            SizedBox(height: 10,),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 5, backgroundColor: Colors.green),
                      SizedBox(width: 15),
                      Text(
                        'Present',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      CircleAvatar(radius: 5, backgroundColor: Colors.red),
                      SizedBox(width: 15),
                      Text(
                        'Absent',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
