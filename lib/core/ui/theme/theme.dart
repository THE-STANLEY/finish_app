import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(19, 158, 158, 158),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(19, 158, 158, 158),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.orange,
    unselectedItemColor: Color.fromARGB(255, 219, 217, 217),
    backgroundColor: Color.fromARGB(19, 158, 158, 158),
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
    backgroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 0.702),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
  textTheme: _textTheme,
  dividerColor: Colors.white24,
);

final _textTheme = TextTheme(
  titleLarge: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
  titleMedium: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
  titleSmall: TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.bold,
      color: const Color.fromARGB(141, 102, 101, 101)),
  labelLarge: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
  labelMedium: TextStyle(
      color: Colors.orange, fontSize: 17.sp, fontWeight: FontWeight.bold),
  labelSmall: TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.grey),
);
