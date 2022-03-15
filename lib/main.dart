import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //underscore represents a private class
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Sloth', 'score': 1},
        {'text': 'Giraphe', 'score': 10},
        {'text': 'Rhino', 'score': 3},
        {'text': 'Dog', 'score': 1}
      ],
    },
    {
      'questionText': 'Who\'s your favorite person?',
      'answers': [
        {'text': 'Alec', 'score': 1},
        {'text': 'Alec', 'score': 1},
        {'text': 'Alec', 'score': 1},
        {'text': 'Alec', 'score': 1}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;

    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('First Application'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
