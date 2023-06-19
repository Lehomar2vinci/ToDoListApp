import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/tasks_provider.dart';
import 'package:todolist/tasks/task_details.dart';
import 'package:todolist/tasks/task_form.dart';

class TaskPreview extends StatelessWidget {
  final Task task;

  const TaskPreview({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.content),
      subtitle: Text(task.done ? 'Fait' : 'Pas fait'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TaskDetailsScreen(task: task)),
        );
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              Provider.of<TasksProvider>(context, listen: false).delete(task);
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TaskForm(
                        task: task,
                        onSubmit: (updatedTask) {
                          Provider.of<TasksProvider>(context, listen: false)
                              .update(updatedTask);
                        })),
              );
            },
          ),
        ],
      ),
    );
  }
}
