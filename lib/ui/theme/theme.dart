import 'package:flutter/material.dart';

var themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 8, 84, 146),
  ),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 0.702),
  textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
        fontFamily: 'MainStyle',
      ),
      titleMedium: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(
          color: Colors.orange, fontSize: 17, fontWeight: FontWeight.normal)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.grey,
  ),
  dividerColor: Colors.white24,
);
