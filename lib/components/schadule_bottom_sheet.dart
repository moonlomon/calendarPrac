import 'package:flutter/material.dart';
import 'package:prac_calendar/const/colors.dart';
import 'custom_text_feild.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {



  @override
  Widget build(BuildContext context) {

    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 2 + bottomInset,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: bottomInset),
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(child: CustumTextFeild(label: '시작시간',isTime: true)),
                  SizedBox(width: 16.0,),
                  Expanded(child: CustumTextFeild(label: '종료시간',isTime: true)),
                ],
              ),
              const SizedBox(height: 8.0,),
              const Expanded(child: CustumTextFeild(label: '내용', isTime: false,)),
              const SizedBox(height: 8.0,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onSavePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                  ),
                  child: Text('저장'),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

void onSavePressed() {
}

