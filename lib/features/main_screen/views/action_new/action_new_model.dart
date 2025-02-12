import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../core/domain/entity/group.dart';

class ActionNewModel {
  var groupName = '';
  var groupDesc = '';
  var groupTarget = '';

  void saveGroup(BuildContext context) async {
    if (groupName.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    final task = Group(name: groupName, desc: groupDesc, target: groupTarget);
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
