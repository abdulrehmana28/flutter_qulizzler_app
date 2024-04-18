import 'package:flutter/material.dart';

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
  int questionNumber = 0;
  bool correctAnswer = false;
  List<Icon> markSign = [];

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
                quizBrain.getQuestion(questionNumber),
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
                correctAnswer = quizBrain.getAnswer(questionNumber);

                if (correctAnswer == true) {
                  questionNumber++;
                  setState(
                    () {
                      markSign.add(
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    },
                  );
                } else {
                  questionNumber++;
                  setState(
                    () {
                      markSign.add(
                        const Icon(
                          Icons.close_rounded,
                          color: Colors.red,
                        ),
                      );
                    },
                  );
                }
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

                correctAnswer = quizBrain.getAnswer(questionNumber);

                if (correctAnswer == false) {
                  questionNumber++;
                  setState(
                    () {
                      markSign.add(
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    },
                  );
                } else {
                  questionNumber++;
                  setState(
                    () {
                      markSign.add(
                        const Icon(
                          Icons.close_rounded,
                          color: Colors.red,
                        ),
                      );
                    },
                  );
                }
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
