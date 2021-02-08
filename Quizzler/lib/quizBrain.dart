import 'questions.dart';
import 'package:flutter/material.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Questions> _questionBank = [
    Questions('Elena Was Turned Into A Vampire In Season 4', true),
    Questions('Damon Loves Caroline', false),
    Questions('In Season 1 Matt Died', false),
    Questions('Bonnie Is A Witch', true),
    Questions('Stefan And Damon Both Are Humans In Season 6', false),
    Questions('Elena Is Dead', false),
    Questions('Kathrine And Elena Are Doppelgangers', true),
    Questions('There Is A Cure To Vampirism', true),
    Questions('Silas Is Damon Brother', false),
    Questions('Klaus Killed Tyler', true),
    Questions('The Originals Were The First Vampires', true),
    Questions('Vampire Diaries Takes Place In Minnesota', false),
    Questions('Enzo Dies', true),
    Questions('Elena Is In A Coma', true),
    Questions('Stefan Was A Vampire Since 1864', true),




  ];

  void nextQuestion(){

    if(_questionNumber < _questionBank.length - 1){
      _questionNumber++;

    }
  }
  String getQuestion(){
    return _questionBank[_questionNumber].questionText;
  }
  bool getAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
  bool isLastQuestion(){
    if(_questionNumber == _questionBank.length - 1){
      return true;
    }
    else{
      return false;
    }
  }
  void resetQuestion(){
    _questionNumber =0;
  }
}