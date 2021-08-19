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
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Create Account"),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TimeLine(1, 4),
          Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Password",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Password will be used to login to account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
          )
        ],
      ),
      floatingActionButton: NextButton(() => {
        navigatePush(context, PersonalInformation())
      }),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}