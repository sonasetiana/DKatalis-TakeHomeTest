
import 'dart:ffi';

import 'package:flutter/material.dart';

class NextButton extends StatelessWidget{
  final VoidCallback callback;

  NextButton(this.callback);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue[300],
              minimumSize: Size(double.infinity, 56)
          ),
          child: Text("Next"),
          onPressed: callback),
    );
  }
}