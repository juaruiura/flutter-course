import 'package:flutter/material.dart';

import './question.dart';

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
  var questionIndex = 0;
  var questions = [
    "What's your favourite color?",
    "What's your favourite animal?",
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
            Question(questions[questionIndex]),
            ElevatedButton(
              child: Text("Answer 1"),
              onPressed: answerQuestion,
            ),
            ElevatedButton(
              child: Text("Answer 2"),
              onPressed: answerQuestion,
            ),
            ElevatedButton(
              child: Text("Answer 3"),
              onPressed: answerQuestion,
            ),
          ]
        ),
      ),
    );
  }

  void answerQuestion() {
    setState(() {
      questionIndex < questions.length-1 ? questionIndex++ : questionIndex = 0;
    });
  }
}