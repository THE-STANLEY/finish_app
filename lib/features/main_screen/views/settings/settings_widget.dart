import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myday/bloc/theme/theme_cubit.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _SettingsWidgetBody();
  }
}

class _SettingsWidgetBody extends StatefulWidget {
  const _SettingsWidgetBody({super.key});

  @override
  State<_SettingsWidgetBody> createState() => _SettingsWidgetBodyState();
}

class _SettingsWidgetBodyState extends State<_SettingsWidgetBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Настройки', style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Column(
        children: [
          _ThemeApp(),
        ],
      ),
    );
  }
}

class _ThemeApp extends StatelessWidget {
  const _ThemeApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    final listStyle = BoxDecoration(
        color: const Color.fromARGB(33, 158, 158, 158),
        borderRadius: BorderRadius.circular(10));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                decoration: listStyle,
                child: ListTile(
                  title: Text(
                    'Темная тема',
                    style: TextStyle(fontSize: 17),
                  ),
                  trailing: CupertinoSwitch(
                    value: isDarkTheme,
                    onChanged: (value) {
                      _setThemeBrightness(context, value);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                decoration: listStyle,
                child: ListTile(
                  title: Text(
                    'Уведомления',
                    style: TextStyle(fontSize: 17),
                  ),
                  trailing: CupertinoSwitch(value: false, onChanged: (v) {}),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                decoration: listStyle,
                child: ListTile(
                  title: Text(
                    'Разрешить аналитику',
                    style: TextStyle(fontSize: 17),
                  ),
                  trailing: CupertinoSwitch(value: true, onChanged: (v) {}),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setThemeBrightness(BuildContext context, bool value) {
    context
        .read<ThemeCubit>()
        .setThemeBrightness(value ? Brightness.dark : Brightness.light);
  }
}
