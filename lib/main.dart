import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s is your favourite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What\'s is your favourite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'Who\'s is your favourite instructor?',
      'answers': ['Max', 'Peter', 'Gary', 'Billy'],
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex <= questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: Column(
            children: [
              Question(
                questions[_questionIndex]['questionText'],
              ),
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          )),
    );
  }
}
