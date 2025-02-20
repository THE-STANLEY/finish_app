import 'package:finish/finish_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'firebase_options.dart';

void main() async {
  final talker = TalkerFlutter.init();
  talker.debug('Talker loaded successfully.');

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  await Hive.initFlutter();

  // await Hive.deleteBoxFromDisk('tasks_box');

  runApp(ScreenUtilInit(
    designSize: Size(360, 640),
    builder: (context, child) {
      return MyDayApp(
        preferences: prefs,
      );
    },
  ));
}
