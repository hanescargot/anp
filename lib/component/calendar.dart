import 'package:anp/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected onDaySelected;

  const Calendar({
    required this.selectedDay,
    required this.focusedDay,
    required this.onDaySelected,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
    );
    final defaultBoxDeco = BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(16.0),
    );

    return TableCalendar(
      focusedDay: focusedDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      rowHeight: 56.0,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
        headerPadding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: PRIMARY_COLOR_200,
          size: 28,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: PRIMARY_COLOR_200,
          size: 28,
        ),
      ),
      onDaySelected: onDaySelected,
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
        weekendDecoration: defaultBoxDeco,
        defaultDecoration: defaultBoxDeco,
        selectedDecoration: BoxDecoration(
          color: PRIMARY_COLOR_200,
          borderRadius: BorderRadius.circular(16.0)
        ),
        todayDecoration: BoxDecoration(
            // image: new DecorationImage(
            //     image: svg_provider.Svg("images/calendar_circle.svg"),
            //     scale: 0.5
            // ),
            // shape: BoxShape.circle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: PRIMARY_COLOR_200,
              width: 0.8, // 두께
            )
        ),
        outsideDecoration: defaultBoxDeco,

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
