import 'package:dKatalis/utils/navigation_utils.dart';
import 'package:dKatalis/views/page/register/schedule_video_call.dart';
import 'package:dKatalis/views/widget/button_widget.dart';
import 'package:dKatalis/views/widget/time_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          TimeLine(2, 4)
        ],
      ),
      floatingActionButton: NextButton(() => {
          navigatePush(context, ScheduleVideoCall())
        }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}