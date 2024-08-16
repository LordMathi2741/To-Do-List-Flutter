
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  State<StatefulWidget> createState() => TaskManagerState();
}

class TaskManagerState extends State<TaskManager> {
  final TextEditingController _taskController = TextEditingController();
  List<String> tasks = [];
  int? _editingIndex;

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void updateTask(String task, int index) {
    setState(() {
      tasks[index] = task;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      width: 500,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: tasks.isNotEmpty
            ? SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10),
                    _editingIndex == index
                        ? Expanded(
                      child: TextField(
                        controller: _taskController
                          ..text = tasks[index],
                        decoration: const InputDecoration(
                          hintText: "Update your task",
                          labelText: "Task",
                          suffixIcon: Icon(Icons.task_alt),
                        ),
                        onSubmitted: (newTask) {
                          updateTask(newTask, index);
                          setState(() {
                            _editingIndex = null;
                          });
                        },
                      ),
                    )
                        : Expanded(
                      child: Text(
                        tasks[index],
                        style: const TextStyle(
                          color: AppTheme.primary,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_editingIndex == null) {
                              setState(() {
                                _taskController.text = tasks[index];
                                _editingIndex = index;
                              });
                            } else if (_editingIndex == index) {
                              updateTask(_taskController.text, index);
                              setState(() {
                                _editingIndex = null;
                              });
                            }
                          },
                          icon: Icon(
                            _editingIndex == index
                                ? Icons.check
                                : Icons.edit,
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: AppTheme.primary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete),
                          style: TextButton.styleFrom(
                            foregroundColor: AppTheme.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        )
            : const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'No tasks available',
            style: TextStyle(
              color: AppTheme.primary,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
