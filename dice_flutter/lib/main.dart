import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.purple,
        ),
        body: DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 3;
  int rightDiceNumber = 5;
  int max1 = 5;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                child: Image.asset('images/dice$leftDiceNumber.png'),
                onPressed: (){
                    onDiceRolled();
                    // leftDiceNumber = Random().nextInt(max1) + 1;
                    // rightDiceNumber = Random().nextInt(max1) + 1; // for both dice to get chaged
                },
              ),
            ),
            Expanded(
              child: FlatButton(
                child: Image.asset('images/dice$rightDiceNumber.png'),
                onPressed: (){
                    onDiceRolled();
                    // rightDiceNumber = Random().nextInt(max1) + 1;
                    // leftDiceNumber = Random().nextInt(max1) + 1; // for both dice to get chaged
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void onDiceRolled() {
    setState(() {
      leftDiceNumber = Random().nextInt(max1) + 1;
      rightDiceNumber =
          Random().nextInt(max1) + 1; // for both dice to get chaged
    });
  }
}
