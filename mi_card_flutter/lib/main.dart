import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
   myApp()
  );
}
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('Images/ilakya2.jpg'),
                radius: 50.0,
              ),
              Text(
                  'Ilakya Gowthaman',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 30.0,
                     fontFamily: 'Pacifico',
                     fontWeight: FontWeight.bold
                   ),
              ),
              Text(
                'SOFTWARE DEVELOPER',
                style: TextStyle(
                  color: Colors.teal.shade100,
                  fontSize: 20.0,
                  fontFamily: 'Source_Sans_Pro',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                // padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                child: ListTile(
                  leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                  ),
                  title: Text(
                  '+91-908-017-9261',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Source_Sans_Pro',
                      color: Colors.teal[700],
                      fontWeight: FontWeight.bold
                  ),
                ) ,
              ),
              ),
              Card(
                color: Colors.white,
                // padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'ilakkiyaa99@gmail.com',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Source_Sans_Pro',
                        color: Colors.teal[700],
                        fontWeight: FontWeight.bold
                    ),
                  ) ,
                )
              )
            ],
          )
        ),
      ),
    );
  }
}

// Row(
// children: [
// Icon(
// Icons.mail,
// color: Colors.teal,
// ),
// SizedBox(
// width: 30.0,
// ),
// Text(
// 'ilakkiyaa99@gmail.com',
// style: TextStyle(
// fontSize: 18.0,
// fontFamily: 'Source_Sans_Pro',
// color: Colors.teal[700],
// fontWeight: FontWeight.bold
// ),
// )
// ],
// ),