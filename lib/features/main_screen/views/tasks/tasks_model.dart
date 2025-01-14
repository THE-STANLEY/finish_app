import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../domain/entity/task.dart';

class TasksModel extends ChangeNotifier {
  var _tasks = <Task>[];
  List<Task> get tasks => _tasks.toList();

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/main/new_task');
  }

  TasksModel() {
    _setup();
  }

  void deleteTask(int taskIndex) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    final box = await Hive.openBox<Task>('tasks_box');
    await box.deleteAt(taskIndex);
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    final box = await Hive.openBox<Task>('tasks_box');
    _tasks = box.values.toList();
    notifyListeners();
    box.listenable().addListener(() {
      _tasks = box.values.toList();
      notifyListeners();
    });
    print('SUCCESSFUL1');
  }
}

class TasksModelProvider extends InheritedNotifier {
  final TasksModel model;
  const TasksModelProvider({
    super.key,
    required this.child,
    required this.model,
  }) : super(child: child, notifier: model);

  @override
  final Widget child;

  static TasksModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TasksModelProvider>();
  }
}
