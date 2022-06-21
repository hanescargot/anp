import 'package:anp/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? selectedDay;
  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
    );


    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
      ),
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
        setState((){
          this.selectedDay = selectedDay;
        });
      },
      selectedDayPredicate:  (DateTime date){
        if(selectedDay == null){
          return false;
        }
        return date.year == selectedDay!.year &&
        date.month == selectedDay!.month &&
        date.day == selectedDay!.day;
      },
      calendarStyle:  CalendarStyle(
        isTodayHighlighted: true,
        defaultDecoration: BoxDecoration(
          shape: BoxShape.circle
          // color: Colors.red[200],  // 200 : 연하게
          // borderRadius: BorderRadius.circular(6.0),
        ),
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: PRIMARY_COLOR,
        ),
        todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: PRIMARY_COLOR,
              width: 1.0, // 두께
            )
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith( // 일부만 오버라이드
          color: Colors.white,
        ),
        todayTextStyle: defaultTextStyle.copyWith(
          color: PRIMARY_COLOR
        )

      ),
    );
  }
}
