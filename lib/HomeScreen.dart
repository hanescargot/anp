import 'package:anp/component/Calendar.dart';
import 'package:anp/component/ListItem.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Calendar(
                onDaySelected: onDaySelected,
                focusedDay: focusedDay,
                selectedDay: selectedDay,
              ),
              SizedBox(height: 8.0,),
              ListItem(
                  startTime: DateTime.now(),
                  endTime: DateTime.now(),
                  content: "예약A", color: Colors.purple
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Methode
  onDaySelected(DateTime selectedDay, DateTime focusedDay){
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }

}
