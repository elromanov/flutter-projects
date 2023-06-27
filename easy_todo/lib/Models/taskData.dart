import 'package:flutter/material.dart';
import 'Task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy bread'),
    Task(name: 'Buy eggs'),
  ];

  int get taskCount{
    return _tasks.length;
  }

  UnmodifiableListView<Task> get Tasks{
    return UnmodifiableListView(_tasks);
  }

  void addTask(String taskTitle){
    _tasks.add(Task(name: taskTitle));
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 
  }

}