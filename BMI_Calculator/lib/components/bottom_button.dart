import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;
  BottomButton({@required this.buttonTitle,@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color:kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(buttonTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,

            ),),
        ),
      ),
    );
  }
}