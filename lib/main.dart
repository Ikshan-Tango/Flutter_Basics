import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//adding _ before any variable or class name makes it a private scope thereby restraining its changablity from outside other places
class _MyAppState extends State<MyApp> {
  var _questionidx = 0;

  void _answerQuestion() {
    setState(() {
      //it calls the build function again to re render the application
      //add the code which ever needs to change its state or re-render the app whenever a local state is changed
      _questionidx += 1;
    });
    print("Answer Question Function: $_questionidx");
  }

  void _goBackQuestion() {
    setState(() {
      //it calls the build function again to re render the application
      //add the code which ever needs to change its state or re-render the app whenever a local state is changed
      _questionidx -= 1;
    });
    print("GO Back Question Function: $_questionidx");
  }

  var _questions = [
    {
      'questionText': 'Do you think mental health is important for one?',
      'answers': ['yes', 'no', 'Of course yes', 'absolutely NO'],
    },
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': ['Max', 'Max', 'Max', 'Max'],
    }
  ];

  @override //used to tell the compiler that i am over riding an already built in function
  Widget build(BuildContext context) {
    //returns the parent widget in which our app will be working

    return MaterialApp(
      // theme: ThemeData(fontFamily: 'Raleway'),
      home: Scaffold(
          //scaffold is yet another widget imported from above which has a better styling
          appBar: AppBar(
            title: Text("Welcome to TICC"),
          ),
          body: (_questionidx < _questions.length)
              ? Quiz(
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                  goBackQuestion: _goBackQuestion,
                  questionidx: _questionidx,
                )
              : Result()),
    );
  }
}
