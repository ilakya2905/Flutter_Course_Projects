import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: magicBall(),
      ),
    );
class magicBall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
            'Ask Me Anything',
          style: TextStyle(
            fontSize: 22.0
          ),
        ),
      ),
      body: ball(),
    );
  }
}
class ball extends StatefulWidget {
  @override
  _ballState createState() => _ballState();
}

class _ballState extends State<ball> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: FlatButton(
            onPressed: (){
              setState(() {
                ballNumber = Random().nextInt(5) + 1;
              });
            },
              child: Image.asset('images/ball$ballNumber.png')
          )
      ),
    );
  }
}

