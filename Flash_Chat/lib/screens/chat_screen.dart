import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: deprecated_member_use
var userEmail;


class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String message;
  final messageController = TextEditingController();
  // ignore: deprecated_member_use
  void getCurrentUser() {
    var user =  _auth.currentUser;
    print('**********************************');
    print(user.email);
    userEmail = _auth.currentUser;
    // print(user.password);
  }
  void getMessages() async{
    await for(var snapshot in _firestore.collection('messages').snapshots()){
      for(var msg in snapshot.docs){
        print(msg.data());
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                  }
                  print('fhu');
                  print(snapshot.data.docs);
                  final messageDocuments = snapshot.data.docs; //list of mesage documents
                  List<MessageBubble> messageWidgets = [];
                  for (var msg in messageDocuments){
                    print(msg['message']);
                    Map message = msg.data();
                    final messageText = message['message'];
                    final messageSender = message['sender'];
                    // print('*****************************8');
                    // print(messageText);
                    final currentUser = userEmail.email;
                    if(messageText != '' && messageSender != ''){
                      final messageWidget = MessageBubble(
                        sender: messageSender,
                        text: messageText,
                        isMe: currentUser == messageSender,
                      );
                      messageWidgets.add(messageWidget);
                      print(currentUser);
                    }


                  }
                  // for(var msg in messageWidgets){
                  //   print(msg.text);
                  // }
                  return Expanded(
                    child: ListView(
                      children: messageWidgets,
                      reverse: true,
                    ),
                  );
                }
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        //Do something with the user input.
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //Implement send functionality.
                      print('pressed');
                      messageController.clear();

                      _firestore.collection('messages').add({
                       'message' : message,
                       'sender' : userEmail.email
                     });
                     // print(userEmail);
                     // print('calling get messages');
                     // getMessages();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MessageBubble extends StatelessWidget {
  final String text, sender;
  final bool isMe;
  MessageBubble({this.text,this.sender, this.isMe});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12.0
            ),
          ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.only(
            topLeft: isMe ? Radius.circular(30.0) : Radius.circular(0.0),
            topRight: isMe ? Radius.circular(0.0) : Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),

          ),
          color: isMe ? Colors.lightBlueAccent : Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              text,
            style: TextStyle(
              fontSize: 16.0,
              color: isMe ? Colors.white : Colors.black54
      )),
          ),
        )
        ],



      ),
    );
  }
}

