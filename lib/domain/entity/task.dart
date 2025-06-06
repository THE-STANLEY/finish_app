import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

@HiveType(typeId: 2)
class Task extends HiveObject {
  Task({required this.text, required this.isDone, required this.description});

  @HiveField(0)
  String text;

  @HiveField(1)
  bool isDone;

  @HiveField(2)
  String description;
}
