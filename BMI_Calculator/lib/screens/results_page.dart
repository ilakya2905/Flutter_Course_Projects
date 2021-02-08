import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/cardWidget.dart';
import '../components/bottom_button.dart';

class Results extends StatelessWidget {

  final String bmi;
  final String result;
  final String interpretation;

  Results({@required this.bmi, @required this.interpretation, @required this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleStyle,

              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: resuableCode(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(result.toUpperCase(), style: kResultStyle, textAlign: TextAlign.center,),
                  Text(
                    bmi,
                    style: kBMIStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: BottomButton(
                buttonTitle: 'RE-CALCULATE',
                onTap: (){
                  Navigator.pop(context);
                },
              )
          )

        ],
      ),
    );
  }
}
