import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = "You did it!";
    if (resultScore <= 8) {
      resultText = "You're rad man!";
    } else if (resultScore <= 12) {
      resultText = "You're okay, I guess!";
    } else if (resultScore <= 16) {
      resultText = "You're kind of a strange person!";
    } else {
      resultText = "How are you this weird?...";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(
          resultPhrase,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: resetQuiz,
          child: const Text('Restart Quiz!'),
        ),
      ]),
    );
  }
}
