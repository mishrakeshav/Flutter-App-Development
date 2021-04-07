import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:just_do_it/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Stay Home'),
    Task(name: 'Stay Home'),
    Task(name: 'Just Do It'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String name) {
    _tasks.add(Task(name: name));
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
