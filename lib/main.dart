import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:workspace/views/widget/time_line.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DKatalis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Example(),
    );
  }
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(elevation: 0.0,),
      body: Column(
        children: [
          TimeLine(1, ["1", "2", "3", "4"])
        ],
      ),
    );
  }
}