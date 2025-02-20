import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../core/domain/entity/task.dart';

class ActionNewModel {
  var groupName = '';
  var groupDesc = '';
  var groupTarget = '';
  var groupCreateDate = '';
  var groupdayPart = 'Весь день';
  bool groupRegular = false;
  var groupRegularType = '';
  bool isDone = false;

  void saveGroup(BuildContext context) async {
    if (groupName.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    final box = await Hive.openBox<Task>('tasks_box');
    final task = Task(
      name: groupName,
      desc: groupDesc,
      target: groupTarget,
      date: groupCreateDate,
      dayPart: groupdayPart,
      regular: groupRegular,
      regularType: groupRegularType,
      isDone: isDone,
    );
    box.add(task);

    Navigator.of(context).pop();
  }
}

class ActionNewModelProvider extends InheritedWidget {
  final ActionNewModel model;
  const ActionNewModelProvider(
      {super.key, required this.child, required this.model})
      : super(child: child);

  @override
  final Widget child;

  static ActionNewModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ActionNewModelProvider>();
  }

  @override
  bool updateShouldNotify(ActionNewModelProvider oldWidget) {
    return true;
  }
}
