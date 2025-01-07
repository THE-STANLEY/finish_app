import 'package:flutter/material.dart';

var themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 8, 84, 146),
  ),
  useMaterial3: true,
  textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
        fontFamily: 'MainStyle',
      ),
      titleMedium: TextStyle(
          color: Colors.purple, fontSize: 25, fontWeight: FontWeight.bold)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.purple,
  ),
  dividerColor: Colors.white24,
);
