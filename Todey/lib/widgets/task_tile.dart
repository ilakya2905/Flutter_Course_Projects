import 'package:flutter/material.dart';
class TaskTile extends StatelessWidget {

  final bool isCheckedBox;
  final String title;
  final Function checkBoxCallback;
  final deleteTask;
  TaskTile({this.title, this.isCheckedBox, this.checkBoxCallback, this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteTask,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20.0,
          decoration: isCheckedBox ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
        value: isCheckedBox,
        activeColor: Colors.lightBlueAccent,
        onChanged:checkBoxCallback
      )

    );
  }
}

class TaskCheckBox extends StatelessWidget {

  final bool isChecked;
  final Function checkBoxToggle;

  TaskCheckBox({this.isChecked, this.checkBoxToggle});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: (newValue){
          checkBoxToggle(newValue);
        },
    );
  }
}
