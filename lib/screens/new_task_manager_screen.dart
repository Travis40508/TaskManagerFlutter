import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/models/task_manager.dart';

class NewTaskManagerScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('Add Task'),
      ),
      body: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Ex. Do Laundry'),
        onSubmitted: (text) {
          Provider.of<TaskManager>(context, listen: false).add(Task(title: text));
          _controller.clear();
        },
      ),
    );
  }
}
