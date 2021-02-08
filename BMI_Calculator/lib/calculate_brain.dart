import 'package:flutter/material.dart';
import 'dart:math';

class CalculateBrain {
  final int height;
  final int weight;
  double _bmi;
  CalculateBrain({@required this.height,@required this.weight});

  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
}
String getResult(){
    if(_bmi >= 25){
      return 'overweight';
    }
    else if(_bmi <=18.5){
      return 'underweight';
    }
    else{
      return 'Normal';
    }
}
  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have a higher body weight than normal. Try to exercise more and stay fit!';
    }
    else if(_bmi <=18.5){
      return 'You have a lower body weight than normal. You can eat healthy foods little more!';
    }
    else{
      return 'You have a normal body weight and healthy BMI. Good job and try to maintain!';
    }
  }
}