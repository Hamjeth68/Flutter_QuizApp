import 'package:flutter/material.dart';

//my files
import './question.dart';
import './answer.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//mystate class
class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabit', 'Cat', 'Dog', 'Bird'],
    },
    {
      'questionText': 'What\'s your favorite Country?',
      'answers': ['German', 'italy', 'France', 'London'],
    },
  ];
  var questionIndex = 0;

  void answerQuestion() {
    if (questionIndex < _questions.length) {
      print('We have more questions!');
    }

    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Application'),
        ),
        body: questionIndex < _questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: _questions,
              )
            : Center(child: Text('You did it!')),
      ),
    );
  }
}
