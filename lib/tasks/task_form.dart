import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskForm extends StatefulWidget {
  final Task? task;
  final Function onSubmit;

  const TaskForm({Key? key, this.task, required this.onSubmit})
      : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController _contentController;
  late bool _done;

  @override
  void initState() {
    super.initState();
    _contentController =
        TextEditingController(text: widget.task?.content ?? '');
    _done = widget.task?.done ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task != null ? 'Edit Task' : 'Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Content'),
              onChanged: (value) {
                setState(() {
                  // Update content when it changes
                });
              },
              controller: _contentController,
            ),
            CheckboxListTile(
              title: const Text('Done'),
              value: _done,
              onChanged: (value) {
                setState(() {
                  // Update done when it changes
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                final content = _contentController.text;
                final done = _done;
                final now = DateTime.now();

                if (widget.task != null) {
                  // Update existing task
                  final updatedTask = Task(
                    id: widget.task!.id,
                    content: content,
                    done: done,
                    createdAt: widget.task!.createdAt,
                    updatedAt: now,
                  );
                  widget.onSubmit(updatedTask);
                } else {
                  // Create a new task
                  final newTask = Task(
                    content: content,
                    done: done,
                    createdAt: now,
                    updatedAt: now,
                  );
                  widget.onSubmit(newTask);
                }
                Navigator.pop(context);
              },
              child: Text(widget.task != null ? 'Save' : 'Add'),
            ),
          ],
        ),
      ),
    );
  }
}
