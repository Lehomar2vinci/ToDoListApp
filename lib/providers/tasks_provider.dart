import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void update(Task task) {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      notifyListeners();
    }
  }

  void delete(Task task) {
    _tasks.removeWhere((t) => t.id == task.id);
    notifyListeners();
  }

  Task findById(String id) {
    return _tasks.firstWhere((task) => task.id == id);
  }
}
