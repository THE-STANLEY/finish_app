import 'package:flutter/material.dart';

class VersionApp extends StatelessWidget {
  const VersionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          'Версия: 0.0.1',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
