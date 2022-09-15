import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  int totalScore = 0;

  void checkAnswer(bool userPickedAnswer) {
    setState(
          () {
        if(quizBrain.isFinished()==true){
          Alert(
              context: context, title: "Quiz Over",
              desc: "This is the end of the Quiz. Thank you for taking the quiz!!").show();
          quizBrain.reset();
          scoreKeeper=[];
        }
        else {
          bool correctanswer = quizBrain.getQuestionAnswer();
          if (userPickedAnswer == correctanswer) {
            scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
            totalScore++;
          } else {
            scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
          }
          quizBrain.nextQuestion();
        }
      },
    );
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
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          color: Colors.green,
          child: TextButton(
            child: const Text(
              'True',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              checkAnswer(true);
            },
          ),
        ),
        const SizedBox(
          width: 10.0,
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          color: Colors.red,
          child: TextButton(
            child: const Text(
              'False',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              checkAnswer(false);
            },
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}