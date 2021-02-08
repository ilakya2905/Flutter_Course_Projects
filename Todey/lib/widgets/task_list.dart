import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/tasks_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:provider/provider.dart';
class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData,child){
        // instead of Provider.of<TaskData>(context) for listening the provider varaiable each time,
        // we can use consumer widget and use the varaible used in tje 2nd argument as a replacment
        return ListView.builder(
          itemBuilder: (context,index){
            final task1 = taskData.tasks[index];
            return TaskTile(
              title: task1.title,
              isCheckedBox: task1.isDone,
              checkBoxCallback: (newValue){
                taskData.updateCheckBox(task1);
              },
              deleteTask: (){
                print("onlongpress");
                taskData.deleteTask(task1);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
      // child:
    );
  }
}

