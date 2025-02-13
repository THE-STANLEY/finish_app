import 'package:hive_flutter/hive_flutter.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
class Group extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String desc;

  @HiveField(2)
  String? target;

  @HiveField(3)
  String? date;

  @HiveField(4)
  String dayPart;

  @HiveField(5)
  bool regular;

  @HiveField(6)
  String? regularType;

  @HiveField(7)
  bool isDone;

  Group({
    required this.name,
    required this.desc,
    this.target,
    this.date,
    required this.dayPart,
    required this.regular,
    this.regularType,
    required this.isDone,
  });
}
