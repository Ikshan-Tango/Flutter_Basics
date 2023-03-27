import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      myQuestion; //adding final helps to get rid of warning of statelesswidget which says that myQuesiton can be dynamic but it will be same for a particular question

  Question(
      this.myQuestion); //this constructor will be called first where ever we use this question component, and that question will get value of myQuestion

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
          myQuestion,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
          textAlign: TextAlign.center,
        ));
  }
}
