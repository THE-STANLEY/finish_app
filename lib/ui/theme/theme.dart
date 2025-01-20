import 'package:flutter/material.dart';

var themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
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
      titleSmall: TextStyle(
          color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
      labelLarge: TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(
          color: Colors.orange, fontSize: 17, fontWeight: FontWeight.normal)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.grey,
    backgroundColor: Color.fromARGB(207, 255, 255, 255),
  ),
  dividerColor: Colors.white24,
);
