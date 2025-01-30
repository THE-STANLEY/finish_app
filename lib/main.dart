import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myday/my_day_app.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  final talker = TalkerFlutter.init();
  talker.debug('Talker loaded successfully.');

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyDayApp());
}
