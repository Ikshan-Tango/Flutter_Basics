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
  int _totalScore = 0;

  void _answerQuestion(int toAddScore) {
    _totalScore += toAddScore;
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
      'answers': [
        {'text': 'yes', 'score': 5},
        {'text': 'no', 'score': -5},
        {'text': 'Of course yes', 'score': 10},
        {'text': 'Of course NO', 'score': -10}
      ],
    },
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 15},
        {'text': 'White', 'score': 20}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 15},
        {'text': 'Lion', 'score': 20}
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Biryani', 'score': 5},
        {'text': 'Pizza', 'score': 10},
        {'text': 'Burger', 'score': 15},
        {'text': 'Pasta', 'score': 20}
      ],
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
              : Result(_totalScore)),
    );
  }
}
