import 'package:flutter/material.dart';

import 'views/views.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _bottomSelected = 0;

  static final _widgetOptions = <Widget>[
    const TasksWidget(),
    const SettingsWidget()
  ];

  void _bottomSelect(int index) {
    if (_bottomSelected == index) return;

    setState(() {
      _bottomSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_bottomSelected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomSelected,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Задачи'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Параметры'),
        ],
        onTap: _bottomSelect,
      ),
    );
  }
}
