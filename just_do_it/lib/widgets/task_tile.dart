import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  Function checkboxCallback;
  Function deleteTask;
  TaskTile(
      {this.isChecked, this.title, this.checkboxCallback, this.deleteTask});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: deleteTask,
        title: Text(
          title,
          style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: checkboxCallback,
        ));
  }
}
