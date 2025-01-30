import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myday/bloc/theme/theme_cubit.dart';
import 'package:myday/version.dart';

import '../../../../ui/ui.dart';

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
          _Switchs(),
          _Links(),
        ],
      ),
    );
  }
}

class _Switchs extends StatelessWidget {
  const _Switchs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
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
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _setThemeBrightness(BuildContext context, bool value) {
    context
        .read<ThemeCubit>()
        .setThemeBrightness(value ? Brightness.dark : Brightness.light);
  }
}

class _Links extends StatelessWidget {
  const _Links({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            decoration: listStyle,
            child: ListTile(
              leading: SvgPicture.asset(
                './assets/svg/like.svg',
                width: 30,
                height: 30,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(153, 255, 255, 255)
                    : Colors.black,
              ),
              title: Text('Поддержать разработчиков'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            decoration: listStyle,
            child: ListTile(
              leading: SvgPicture.asset(
                './assets/svg/report.svg',
                width: 30,
                height: 30,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(153, 255, 255, 255)
                    : Colors.black,
              ),
              title: Text('Сообщить о баге'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            decoration: listStyle,
            child: ListTile(
              leading: SvgPicture.asset(
                './assets/svg/star.svg',
                width: 30,
                height: 30,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(153, 255, 255, 255)
                    : Colors.black,
              ),
              title: Text('Оценить приложение'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        VersionApp(),
      ],
    );
  }
}
