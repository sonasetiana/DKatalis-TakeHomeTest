import 'package:dKatalis/utils/navigation_utils.dart';
import 'package:dKatalis/views/page/register/personal_information.dart';
import 'package:dKatalis/views/widget/button_widget.dart';
import 'package:dKatalis/views/widget/input_widget.dart';
import 'package:dKatalis/views/widget/time_line.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget{
  @override
  _InputPasswordSate createState() => _InputPasswordSate();

}

class _InputPasswordSate extends State<InputPassword>{

  late String _complexity;
  int _step = 0;
  bool _visiblePassword = false;
  IconData _icon = Icons.visibility;

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
        children: [
          TimeLine(1, 4),
          SizedBox(height: 48,),
          Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WordingText(
                        "Create Password",
                        "Password will be used to login to account"
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: TextField(
                        obscureText: !_visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'Create Password',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                                !_visiblePassword ? Icons.visibility : Icons.visibility_off,
                                color: !_visiblePassword ? Colors.blue:Colors.grey),
                            onPressed: (){
                              setState(() {
                                _icon = !_visiblePassword ? Icons.visibility : Icons.visibility_off;
                                _visiblePassword = !_visiblePassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    RichText(
                        text: TextSpan(
                            text: "Complexity : ",
                            style: TextStyle(color: Colors.white60),
                          children: [
                            TextSpan(
                                text: "Very Weak",
                                style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)
                            )
                          ]
                        )
                    ),
                    SizedBox(height: 48,),
                    PasswordRegexInfo(_step)
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