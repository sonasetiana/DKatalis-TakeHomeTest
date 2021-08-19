
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget{
  final List<String> title;
  final int step;

  TimeLine(this.step, this.title);

  @override
  Widget build(BuildContext context) {
     return Container(
       padding: const EdgeInsets.only(
         left: 16.0, right: 16.0, bottom: 48.0
       ),
       color: Colors.blue,
       child: timeView(),
     );
  }

  Widget timeView(){
    List<Widget> widgets = <Widget>[];
    int index = 0;
    for(var i = 0; i < title.length + (title.length-1); i++){
      if(i % 2 == 0){
        widgets.add(step > index ? stepBox(title[index],Colors.green):stepBox(title[index], Colors.white));
        index++;
      }else{
        widgets.add(stepLine());
      }
    }
    return new Row(children: widgets);
  }

  Widget stepBox(String text, Color bgColor){
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(
              width: 1,
              color: Colors.black,
              style: BorderStyle.solid
          )
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),
    );
  }

  Widget stepLine() {
    return Container(
      color: Colors.black,
      height: 3.0,
      width: 45.0,
    );
  }

}