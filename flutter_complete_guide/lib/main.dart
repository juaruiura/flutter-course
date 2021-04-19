import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var questions = [
    {
      "question": "What's your favourite color?",
      "answers": ["Black", "Red", "Green", "White"],
    },
    {
      "question": "What's your favourite animal?",
      "answers": ["Rabbit", "Snake", "Elephant", "Lion"],
    },
    {
      "question": "Who's your favourite instructor?",
      "answers": ["Max", "Max", "Max", "Max"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]["question"]),
            ...(questions[_questionIndex]["answers"] as List<String>).map(
              (answer) => Answer(_answerQuestion, answer)
            ).toList(),
            //... operator spreads the answer list we have into individual answers
          ]
        ),
      ),
    );
  }

  void _answerQuestion() {
    setState(() {
      _questionIndex < questions.length-1 ? _questionIndex++ : _questionIndex = 0;
    });
  }
}