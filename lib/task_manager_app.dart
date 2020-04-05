import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/models/task_manager.dart';
import 'package:task_manager/routes/new_task_manager_route.dart';
import 'package:task_manager/screens/new_task_screen.dart';
import 'package:task_manager/screens/task_manager_screen.dart';


class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskManager(),
      child: MaterialApp(
        title: 'Task Manager',
        debugShowCheckedModeBanner: false,
        home: TaskManagerScreen(),
        routes: {
          NewTaskManagerRoute.routeName: (context) => NewTaskScreen()
        },
      ),
    );
  }
}
