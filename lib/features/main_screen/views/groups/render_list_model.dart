import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/domain/entity/group.dart';

class RenderListModel extends ChangeNotifier {
  var _groups = <Group>[];
  List<Group> get groups => _groups.toList();

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/main/action_new');
  }

  RenderListModel() {
    _setup();
  }

  void deleteGroup(int groupIndex) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    await box.deleteAt(groupIndex);
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    _groups = box.values.toList();
    notifyListeners();
    box.listenable().addListener(() {
      _groups = box.values.toList();
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
