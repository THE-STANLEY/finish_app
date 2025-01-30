import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(6, 158, 158, 158),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(19, 158, 158, 158),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.orange,
    unselectedItemColor: Color.fromARGB(255, 219, 217, 217),
    backgroundColor: Color.fromARGB(6, 158, 158, 158),
  ),
  textTheme: _textTheme,
  dividerColor: Colors.white24,
);

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(33, 158, 158, 158),
  ),
  // scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 0.702),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.grey,
    backgroundColor: Color.fromARGB(209, 255, 255, 255),
  ),
  textTheme: _textTheme,
  dividerColor: Colors.white24,
);

final _textTheme = TextTheme(
  titleLarge: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.orange,
    fontFamily: 'MainStyle',
  ),
  titleMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  titleSmall: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
  labelLarge: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
  labelMedium: TextStyle(
      color: Colors.orange, fontSize: 17, fontWeight: FontWeight.normal),
);
