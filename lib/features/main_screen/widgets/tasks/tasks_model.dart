import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../domain/entity/group.dart';
import '../../../../domain/entity/task.dart';

class TasksModel extends ChangeNotifier {
  TasksModel({required this.groupKey}) {
    _setup();
  }
  int groupKey;
  var _tasks = <Task>[];
  List<Task> get tasks => _tasks.toList();

  late final Future<Box<Group>> _groupBox;
  Group? _group;
  Group? get group => _group;

  void _loadGroup() async {
    final box = await _groupBox;
    _group = box.get(groupKey);
    notifyListeners();
  }

  void _readTasks() {
    _tasks = group?.tasks ?? <Task>[];
    notifyListeners();
  }

  void _setupListen() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    final box = await Hive.openBox<Task>('tasks_group');
    _readTasks();
    box.watch().listen((event) {
      _readTasks();
    });
  }

  void deleteTask(int groupIndex) async {
    await _group?.tasks?.deleteFromHive(groupIndex);
    await _group?.save();
  }

  void _setup() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    _groupBox = Hive.openBox<Group>('groups_box');
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(TaskAdapter());
    }
    Hive.openBox<Task>('tasks_box');
    _loadGroup();
    _setupListen();
  }

  void showForm(BuildContext context) {
    Navigator.of(context)
        .pushNamed('/main/tasks/new_task', arguments: groupKey);
  }
}

class TasksModelProvider extends InheritedNotifier {
  final TasksModel model;
  const TasksModelProvider(
      {super.key, required this.model, required this.child})
      : super(child: child, notifier: model);

  @override
  final Widget child;

  static TasksModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TasksModelProvider>();
  }

  @override
  bool updateShouldNotify(TasksModelProvider oldWidget) {
    return false;
  }
}
