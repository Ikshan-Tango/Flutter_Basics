import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final VoidCallback answerQuestion;
  final int questionidx;
  final VoidCallback goBackQuestion;

  final List<Map<String, Object>> questions;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.goBackQuestion,
      required this.questionidx});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionidx]['questionText'].toString(),
        ),

        //every answer depends on the question, therefor answer widget depends on question and main.dart (for updating index) as well

        //what we are doing here is that in children, there comes widgets which are in a list, and in a list we are adding another list because map function needs that, by adding ... we are defragmenting the inner lists to separate alag alag widgets
        ...(questions[questionidx]['answers'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList(),

        //to go backward
        FloatingActionButton(
          onPressed: goBackQuestion,
          child: Icon(Icons.no_adult_content),
        ),
      ],
    );
  }
}
