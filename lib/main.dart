import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quizbank.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
  QuizBank quizBrain = QuizBank();

  bool correctAnswer = false;
  List<Icon> markSign = [];

  //TODO: Make function

  void alertBox() {
    Alert(
            context: context,
            type: AlertType.info,
            title: 'Quiz Finished',
            desc: 'Great Work')
        .show();
  }

  void checkAnswer(bool userEnteredAnswer) {
    correctAnswer = quizBrain.getAnswer();

    setState(() {
      if (quizBrain.isFinishQuestion() == true) {
        alertBox();
        quizBrain.resetQuestions();
        markSign = [];
        //-------------Mark sign logic-------------
      } else if (userEnteredAnswer == correctAnswer) {
        markSign.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        quizBrain.nextQuestion();
      } else {
        markSign.add(
          const Icon(
            Icons.close_rounded,
            color: Colors.red,
          ),
        );
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: markSign,
        ),
      ],
    );
  }
}
