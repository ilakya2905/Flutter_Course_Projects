import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber){
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }
  Expanded buildKey({int soundNumber, Color colorName}){
    return Expanded(
      child: FlatButton(

        color: colorName,
        onPressed: (){
          playSound(soundNumber);
        },

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(soundNumber: 1, colorName: Colors.red),
              buildKey(soundNumber: 2, colorName: Colors.orange),
              buildKey(soundNumber: 3, colorName: Colors.yellow),
              buildKey(soundNumber: 4, colorName: Colors.green),
              buildKey(soundNumber: 5, colorName: Colors.teal),
              buildKey(soundNumber: 6, colorName: Colors.blue),
              buildKey(soundNumber: 7, colorName: Colors.purple),

            ],
          ),
        ),
      ),
    );
  }
}
