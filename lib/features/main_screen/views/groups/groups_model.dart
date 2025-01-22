import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../domain/entity/group.dart';
import '../../../../domain/entity/task.dart';

class GroupsModel extends ChangeNotifier {
  var _groups = <Group>[];
  List<Group> get groups => _groups.toList();

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/main/new_group');
  }

  void showTasks(BuildContext context, int groupIndex) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    final groupKey = box.keyAt(groupIndex) as int;

    Navigator.of(context).pushNamed('/main/tasks', arguments: groupKey);
  }

  GroupsModel() {
    _setup();
  }

  void deleteGroup(int groupIndex) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    await box.getAt(groupIndex)?.tasks?.deleteAllFromHive();
    await box.deleteAt(groupIndex);
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(TaskAdapter());
    }
    await Hive.openBox<Task>('tasks_box');
    _groups = box.values.toList();
    notifyListeners();
    box.listenable().addListener(() {
      _groups = box.values.toList();
      notifyListeners();
    });
  }
}

class GroupsModelProvider extends InheritedNotifier {
  final GroupsModel model;
  const GroupsModelProvider({
    super.key,
    required this.child,
    required this.model,
  }) : super(child: child, notifier: model);

  @override
  final Widget child;

  static GroupsModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroupsModelProvider>();
  }
}
