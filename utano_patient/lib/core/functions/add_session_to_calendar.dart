import 'package:add_2_calendar/add_2_calendar.dart';

void addSessionToCalendar(session) {
  final Event event = Event(
    title: '',
    description: '',
    location: '',
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    iosParams: const IOSParams(
      reminder: Duration(minutes: 30),
    ),
  );
  Add2Calendar.addEvent2Cal(event);
}
