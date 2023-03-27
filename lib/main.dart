import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

//adding _ before any variable or class name makes it a private scope thereby restraining its changablity from outside other places
class _MyAppState extends State<MyApp> {
  var _questionidx = 0;

  void answerQuestion() {
    setState(() {
      //it calls the build function again to re render the application
      //add the code which ever needs to change its state or re-render the app whenever a local state is changed
      _questionidx += 1;
    });
    print("Answer Question Function: $_questionidx");
  }

  void goBackQuestion() {
    setState(() {
      //it calls the build function again to re render the application
      //add the code which ever needs to change its state or re-render the app whenever a local state is changed
      _questionidx -= 1;
    });
    print("GO Back Question Function: $_questionidx");
  }

  var question = [
    'What is the velocity of light?',
    'Do you think mental health is important?',
    'Lorem Ipsum si de Cilois metre boiuji gyanse mer',
    'Bleh si Ippsm Lorem see gery buja gyane msee '
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
          body: Column(
            children: [
              Question(question[_questionidx]),
              ElevatedButton(
                  onPressed: answerQuestion, child: Text('Answer 1')),
              ElevatedButton(
                  onPressed: answerQuestion, child: Text('Answer 2')),
              ElevatedButton(
                  onPressed: answerQuestion, child: Text('Answer 3')),
              ElevatedButton(
                  onPressed: answerQuestion, child: Text('Answer 4')),
              //to go forward
              FloatingActionButton(
                onPressed: answerQuestion,
                child: Icon(Icons.plus_one),
              ),

              //to go backward
              FloatingActionButton(
                onPressed: goBackQuestion,
                child: Icon(Icons.no_adult_content),
              ),
            ],
          )),
    );
  }
}
