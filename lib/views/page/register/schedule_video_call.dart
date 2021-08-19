import 'package:dKatalis/views/page/register/register_page.dart';
import 'package:dKatalis/views/widget/button_widget.dart';
import 'package:dKatalis/views/widget/time_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleVideoCall extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          TimeLine(3, 4)
        ],
      ),
      floatingActionButton: NextButton(() => {

      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}