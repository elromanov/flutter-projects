import 'package:flutter/material.dart';
import 'package:easy_todo/Widgets/TasksTile.dart';
import 'package:provider/provider.dart';
import 'package:easy_todo/Models/taskData.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(
          itemBuilder: (context, index){
            final task = taskData.Tasks[index];
            return TaskTile(
                title: task.name,
                isChecked: task.isDone,
                checkBoxCallback: (checkBoxState){
                  taskData.updateTask(task);
                },
                longPressCallback: (){
                  taskData.deleteTask(task);
            },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}