import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myday/router/router.dart';
import 'package:myday/ui/ui.dart';

class MyDayApp extends StatelessWidget {
  const MyDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ru', ''),
      supportedLocales: const [
        Locale('en', ''),
        Locale('ru', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Мой День',
      theme: themeData,
      routes: routes,
    );
  }
}
