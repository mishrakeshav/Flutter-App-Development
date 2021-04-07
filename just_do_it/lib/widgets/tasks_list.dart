import 'package:flutter/material.dart';
import 'package:just_do_it/models/task_data.dart';
import 'package:just_do_it/widgets/task_tile.dart';
import 'package:just_do_it/models/task.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemCount: taskdata.taskCount,
          itemBuilder: (context, index) {
            return TaskTile(
              title: taskdata.tasks[index].name,
              isChecked: taskdata.tasks[index].isDone,
              checkboxCallback: (value) => taskdata.toggleTask(index),
              deleteTask: () => taskdata.deleteTask(index),
            );
          },
        );
      },
    );
  }
}
