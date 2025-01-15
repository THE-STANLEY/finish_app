import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../domain/entity/group.dart';

class NewGroupModel {
  var groupName = '';

  void saveGroup(BuildContext context) async {
    if (groupName.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    final task = Group(name: groupName);
    box.add(task);

    Navigator.of(context).pop();
  }
}

class NewGroupModelProvider extends InheritedWidget {
  final NewGroupModel model;
  const NewGroupModelProvider(
      {super.key, required this.child, required this.model})
      : super(child: child);

  @override
  final Widget child;

  static NewGroupModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NewGroupModelProvider>();
  }

  @override
  bool updateShouldNotify(NewGroupModelProvider oldWidget) {
    return true;
  }
}
