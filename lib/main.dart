import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myday/my_day_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  final talker = TalkerFlutter.init();
  talker.debug('Talker loaded successfully.');

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  runApp(
    MyDayApp(
      preferences: prefs,
    ),
  );
}
