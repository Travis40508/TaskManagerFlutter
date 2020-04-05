import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/models/task_manager.dart';
import 'package:task_manager/routes/new_task_manager_route.dart';

class TaskManagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          'Tasks'
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, NewTaskManagerRoute.routeName),
          )
        ],
      ),
      body: Consumer<TaskManager>(
        builder: (context, taskManager, child) {

          return ListView.builder(
            itemCount: taskManager.tasks.length,
            itemBuilder: (context, index) {
              final task = taskManager.tasks[index];

              return Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(task.isCompleted ? Icons.check_circle : Icons.check_circle_outline),
                        onPressed: () => taskManager.updateTask(task),
                      ),
                      Text(task.title),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () => taskManager.deleteTask(task),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
          );
        },
      )
    );
  }
}
