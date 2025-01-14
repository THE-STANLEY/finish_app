import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../domain/entity/task.dart';

class NewTaskModel {
  var taskName = '';

  void saveTask(BuildContext context) async {
    if (taskName.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    final box = await Hive.openBox<Task>('tasks_box');
    final task = Task(name: taskName);
    box.add(task);

    Navigator.of(context).pop();
  }
}

class NewTaskModelProvider extends InheritedWidget {
  final NewTaskModel model;
  const NewTaskModelProvider({
    super.key,
    required this.child,
    required this.model,
  }) : super(child: child);

  @override
  final Widget child;

  static NewTaskModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NewTaskModelProvider>();
  }

  @override
  bool updateShouldNotify(NewTaskModelProvider oldWidget) {
    return true;
  }
}
