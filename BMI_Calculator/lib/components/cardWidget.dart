import 'package:flutter/material.dart';
class resuableCode extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  resuableCode({this.colour, this.cardChild, this.onPress});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.colour,
          borderRadius: BorderRadius.circular(5.0),

        ),

      ),
    );
  }
}
