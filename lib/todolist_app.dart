import 'package:flutter/material.dart';
import 'package:todolist/tasks/tasks_master.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Application Choses à faire',
      home: TasksMaster(),
      debugShowCheckedModeBanner: false,
    );
  }
}
