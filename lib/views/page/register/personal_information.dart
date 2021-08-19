import 'package:dKatalis/utils/navigation_utils.dart';
import 'package:dKatalis/views/page/register/schedule_video_call.dart';
import 'package:dKatalis/views/widget/button_widget.dart';
import 'package:dKatalis/views/widget/time_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalInformation extends StatefulWidget{
  @override
  _PersonalInformationState createState() => _PersonalInformationState();

}

class _PersonalInformationState extends State<PersonalInformation>{

  String hint = "-Choose Option-";
  final List<String> menus = ["Lorem Ipsum", "Dolor Ismet"];
  String selectedActivation = "";
  String selectedIncome = "";
  String selectedExpense = "";

  @override
  void initState() {
    super.initState();
  }

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
          TimeLine(2, 4),
          SizedBox(height: 48,),
          Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Information",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Please fill in the information below and your goal\nfor digital saving.",
                      style: TextStyle(color: Colors.white60),
                    ),
                    SizedBox(height: 32),
                    _fieldDropdownMenu("Goal for activation", selectedActivation, (item) => {
                      setState(() {
                        selectedActivation = item;
                      })
                    }),
                    _fieldDropdownMenu("Monthly income", selectedIncome, (item) => {
                      setState(() {
                        selectedIncome = item;
                      })
                    }),
                    _fieldDropdownMenu("Monthly expense", selectedExpense, (item) => {
                      setState(() {
                        selectedExpense = item;
                      })
                    }),
                  ],
                ),
              )
          )
        ],
      ),
      floatingActionButton: NextButton(() => {
          navigatePush(context, ScheduleVideoCall())
        }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

  _fieldDropdownMenu(String hint, String itemSelected, Function(String) callback){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Stack(
        children: [
          Text(
            hint,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 6),
          DropdownButtonHideUnderline (
            child: DropdownButton(
              isExpanded: true,
              value: itemSelected,
              items: generateItems(),
              onChanged: (item) => {
                callback(item as String)
              },
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> generateItems(){
    List<DropdownMenuItem<String>> items = [];
    items.add(DropdownMenuItem(child: Text("-Choose Option-", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)), value: "",));
    for(var item in menus) {
      items.add(DropdownMenuItem(child: Text(item), value: item));
    }
    return items;
  }
}