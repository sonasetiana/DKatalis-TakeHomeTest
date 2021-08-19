import 'package:flutter/material.dart';

navigatePush(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return widget;
  }));
}