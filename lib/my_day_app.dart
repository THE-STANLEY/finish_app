import 'package:flutter/material.dart';
import 'package:myday/router/router.dart';
import 'package:myday/ui/ui.dart';

class MyDayApp extends StatelessWidget {
  const MyDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мой День',
      theme: themeData,
      initialRoute: '/main',
      routes: routes,
    );
  }
}
