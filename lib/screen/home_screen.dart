import 'package:flutter/material.dart';
import 'package:prac_calendar/components/schadule_card.dart';
import 'package:prac_calendar/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/main_calendar.dart';
import '../components/schadule_bottom_sheet.dart';
import '../components/today_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (_) => const ScheduleBottomSheet(),
            // bottomSheet의 높이를 고정(화면의 절반)에서 화면최대를 모두 사용할 수 있게 정의 -> 스크롤 가능
            isScrollControlled: true
          );
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(selectedDate: selectedDate, onDaySelected: onDaySelected),
            const SizedBox(height: 8.0,),
            TodayBanner(selectedDate: selectedDate, count: 10,),
            const SizedBox(height: 8.0,),
            SchaduleCard(startTime: 12, endTime: 13, content: 'test'),
          ],
        ),
      ),
    );
  }
}
