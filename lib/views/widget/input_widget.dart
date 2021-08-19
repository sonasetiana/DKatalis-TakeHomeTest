


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PasswordRegexInfo extends StatelessWidget{

  final int step;

  PasswordRegexInfo(this.step);

  @override
  Widget build(BuildContext context) {
    double _spacing = 20;
    return Row(
      children: [
        _label(0, "a", "Lowercase"),
        SizedBox(width: _spacing,),
        _label(1, "A", "Uppercase"),
        SizedBox(width: _spacing,),
        _label(2, "123", "Number"),
        SizedBox(width: _spacing,),
        _label(3, "9+", "Characters")
      ],
    );
  }

  _label(int num,String symbol, String description){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        step > num ?
        Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: Center(child: Icon(Icons.check, color: Colors.white, size: 24,))
        ) :
        Text(
          symbol,
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        SizedBox(height: 8,),
        Text(
          description,
          style: TextStyle(color: Colors.white60, fontSize: 14),
        )
      ],
    );
  }
}

class WordingText extends StatelessWidget{
  final String title, description;

  WordingText(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(color: Colors.white60),
        ),
      ],
    );
  }

}