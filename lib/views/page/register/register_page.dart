import 'dart:ui';

import 'package:dKatalis/views/page/register/input_password.dart';
import 'package:dKatalis/views/widget/time_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'dart:math';

import 'package:flutter/painting.dart';

class RegisterPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TimeLine(0, 4),
            Expanded(
                child: ClipPath(
                  clipper: BackgroundCurve(),
                  child: Container(
                    color: Colors.grey[100],
                    padding: EdgeInsets.only(top: 94.0, left: 16.0, right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                              text: "Welcome to",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold
                              ),
                              children: [
                                TextSpan(
                                    text: "\nGIN",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                TextSpan(
                                    text: " Finans",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold
                                    )
                                )
                              ]
                            ),
                        ),
                        SizedBox(height: 16.0,),
                        Text(
                          "Welcome to The Bank of The Future.\nManage and track your accounts on\nthe go.",
                          style: TextStyle(
                            color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 24.0,),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                            ),
                          ),
                        )
                  ],
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blue[200],
                minimumSize: Size(double.infinity, 56)
            ),
            child: Text("Next"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return InputPassword();
              }));
            }),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

}

class BackgroundCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 30.0;
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 100)
      ..quadraticBezierTo(70, 0.8, 0.9, 60)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}