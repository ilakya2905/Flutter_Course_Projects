import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());
QuizBrain quizBrain = QuizBrain();
class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text('Vampire Diaries Quiz',
            style: TextStyle(color: Colors.white,fontSize: 22.0),),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
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
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List <String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  // List<bool> answers =[
  //   false,
  //   true,
  //   true
  // ];
  //tedious proxcess

  // using class object constructor concept

  List<Icon> userAnswerList = [];
  int score=0;
  void checkAnswer(bool userAnswer){
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {

      if(userAnswer == correctAnswer){
        score++;
      userAnswerList.add(Icon(
          Icons.check,
        color: Colors.green,
      ));
    }
    else{
      userAnswerList.add(Icon(
          Icons.close,
        color: Colors.red,
      ));
    }
      if(quizBrain.isLastQuestion()){
        callAlertMessage(context);
      }
      else {
        quizBrain.nextQuestion();
      }
    });
  }
  void callAlertMessage(context){
      print("last question");
      var alertStyle = AlertStyle(
        isCloseButton: false,

      );

      Alert(
        context: context,
        style: alertStyle,
        type: AlertType.success,
        title: "YAY YOU SCORED $score/15 !!!",
        desc: "You have completed the quiz. Click OK to restart.",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                userAnswerList.clear();
                score =0;
                quizBrain.resetQuestion();
              });
              Navigator.pop(context);
              },
            width: 120,
          )
        ],
      ).show();

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
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
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
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //

                  checkAnswer(false);

              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: userAnswerList,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
