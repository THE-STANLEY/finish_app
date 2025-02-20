import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/domain/entity/task.dart';

class RenderListModel extends ChangeNotifier {
  var _tasks = <Task>[];
  List<Task> get tasks => _tasks.toList();

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/main/action_new');
  }

  RenderListModel() {
    _setup();
  }

  void deleteTask(int taskIndex) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    final box = await Hive.openBox<Task>('tasks_box');
    await box.deleteAt(taskIndex);
    notifyListeners();
  }

  void doneToggle(int taskIndex) async {
    final task = _tasks[taskIndex];
    final currentState = _tasks[taskIndex].isDone;
    task.isDone = !currentState;
    await task.save();
    notifyListeners();
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
  }
}

class RenderListModelProvider extends InheritedNotifier {
  final RenderListModel model;
  const RenderListModelProvider({
    super.key,
    required this.child,
    required this.model,
  }) : super(child: child, notifier: model);

  @override
  final Widget child;

  static RenderListModelProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<RenderListModelProvider>();
  }
}
