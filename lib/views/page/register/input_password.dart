import 'package:dKatalis/utils/navigation_utils.dart';
import 'package:dKatalis/views/page/register/personal_information.dart';
import 'package:dKatalis/views/widget/button_widget.dart';
import 'package:dKatalis/views/widget/time_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Create Account"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          TimeLine(1, 4)
        ],
      ),
      floatingActionButton: NextButton(() => {
        navigatePush(context, PersonalInformation())
      }),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}