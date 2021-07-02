import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'text': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'text': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 7}
      ]
    },
    {
      'text': 'What\'s your favorite band?',
      'answers': [
        {'text': 'Led Zeppelin', 'score': 5},
        {'text': 'Metallica', 'score': 8},
        {'text': 'Iron Maiden', 'score': 1}
      ]
    }
  ];

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _totalScore += score;
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  void _resetQuiz() {
    _totalScore = 0;
    _questionIndex = 0;
    setState(() {});
  }

  int _questionIndex = 0;
  int _totalScore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                  )
                : Result(
                    score: _totalScore,
                    onReset: _resetQuiz,
                  ),
          ),
        ),
      ),
    );
  }
}
