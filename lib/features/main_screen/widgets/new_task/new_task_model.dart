import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../domain/entity/group.dart';
import '../../../../domain/entity/task.dart';

class NewTaskModel {
  NewTaskModel({
    required this.groupKey,
  });

  int groupKey;
  var taskText = '';
  var taskDescription = '';

  void saveTask(BuildContext context) async {
    if (taskText.isEmpty) return;

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }

    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(TaskAdapter());
    }

    final taskBox = await Hive.openBox<Task>('tasks_box');
    final task =
        Task(text: taskText, isDone: false, description: taskDescription);
    await taskBox.add(task);

    final groupBox = await Hive.openBox<Group>('groups_box');
    final group = groupBox.get(groupKey);
    group?.addTask(taskBox, task);
    print(group);
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
    return false;
  }
}
