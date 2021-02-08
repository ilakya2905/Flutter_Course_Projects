import 'package:flutter/material.dart';
import '../constants.dart';
class cardContent1 extends StatelessWidget {
  cardContent1({this.icon,this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
            text,
            style: kTextStyleCustom
        )
      ],
    );
  }
}

