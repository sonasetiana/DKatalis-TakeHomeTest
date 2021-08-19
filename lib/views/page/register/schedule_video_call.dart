import 'package:dKatalis/views/page/register/register_page.dart';
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
          TimeLine(3, 4),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[200],
                    minimumSize: Size(double.infinity, 56)
                ),
                child: Text("Next"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return RegisterPage();
                  }));
                }),
          )
        ],
      ),
    );
  }
}