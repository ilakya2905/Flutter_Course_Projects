import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/tasks_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  // final Function addTask;
  static String taskTitle;
  // AddTaskScreen({this.addTask});
  @override
  Widget build(BuildContext context) {


    return Container(
      color: Color(0xff75757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0)),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(

              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                taskTitle = value;
                // print(taskTitle);
              },

            ),
            SizedBox(
              height: 15.0,
            ),

            FlatButton(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('ADD', style: TextStyle(fontSize: 20.0))
              ),
              textColor: Colors.white,
              color: Colors.lightBlueAccent,
              onPressed: (){
                // print('************');
                print(taskTitle);
                Provider.of<TaskData>(context,listen: false).addTaskToList(taskTitle);
                Navigator.pop(context);
                // context.read<TaskData>().addTaskToList(taskTitle);

              },
            ),
          ],
        ),
      ),
    );
  }
}
