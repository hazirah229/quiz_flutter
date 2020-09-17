import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_flutter/question.dart';

void main() {
  runApp(Quizzies());
}

class Quizzies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Widget> scoreKeeper = [];
  // List<String> question = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  //
   int questNum = 0;
  // List<bool> answers = [false, true, false];
  //
  // Question quest = Question(q: 'You can lead a cow down stairs but not up stairs.', a: false);

  List<Question> questLs = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
    Question(q: 'A slug\'s blood is green.', a: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //question[questNum],
                questLs[questNum].questionQ,
                textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: Text('True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //bool correctAns = answers[questNum];
                bool correctAns = questLs[questNum].answerA;
                if(correctAns == true) {
                  print('User got it right');
                  scoreKeeper.add(
                    Icon(Icons.check, color: Colors.green,),
                  );
                } else {
                  print('User got it wrong');
                  scoreKeeper.add(
                    Icon(Icons.close, color: Colors.red,),
                  );
                }
                setState(() {
                  questNum = Random().nextInt(3);
                });
                // scoreKeeper.add(
                //   Icon(Icons.check, color: Colors.green,),
                // );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text('False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //bool correctAns = answers[questNum];
                bool correctAns = questLs[questNum].answerA;
                if(correctAns == false) {
                  print('User got it right');
                  scoreKeeper.add(
                    Icon(Icons.check, color: Colors.green,),
                  );
                } else {
                  print('User got it wrong');
                  scoreKeeper.add(
                    Icon(Icons.close, color: Colors.red,),
                  );
                }
                setState(() {
                  questNum = Random().nextInt(2);
                });

              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
             children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}

/*
Question1: 'You can lead a cow down stairs but not up stairs.', false,
Question2: 'Approximately one quarter of human bones are in the feet.', true,
Question3: 'A slug\'s blood is green.', true,
*/
