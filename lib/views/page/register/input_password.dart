import 'package:dKatalis/views/widget/time_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          TimeLine(1, 4)
        ],
      ),
    );
  }
}