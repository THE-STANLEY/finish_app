import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myday/bloc/theme/theme_cubit.dart';
import 'package:myday/version.dart';

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
      body: ListView(
        children: [
          _Switchs(),
          _Links(),
          VersionApp(),
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
    final listStyle = BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(19, 158, 158, 158)
          : Colors.white,
    );

    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: listStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Основное',
                  style: Theme.of(context).textTheme.titleSmall),
            ),
            ListTile(
              title: Text(
                'Темная тема',
                style: TextStyle(fontSize: 17),
              ),
              trailing: Switch(
                value: isDarkTheme,
                onChanged: (value) {
                  _setThemeBrightness(context, value);
                },
                inactiveTrackColor: Colors.transparent,
                inactiveThumbColor: Colors.grey,
                activeColor: Colors.white,
                activeTrackColor: Colors.green,
              ),
            ),
            Divider(height: 0.1),
            ListTile(
              title: Text(
                'Уведомления',
                style: TextStyle(fontSize: 17),
              ),
              trailing: Switch(
                value: false,
                onChanged: (v) {},
                inactiveTrackColor: Colors.transparent,
                inactiveThumbColor: Colors.grey,
                activeColor: Colors.white,
                activeTrackColor: Colors.green,
              ),
            ),
            Divider(height: 0.1),
            ListTile(
              title: Text(
                'Разрешить аналитику',
                style: TextStyle(fontSize: 17),
              ),
              subtitle: Text(
                'Ваше согласие на аналитику позволит нам улучшить работу сервиса.',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Switch(
                value: true,
                onChanged: (v) {},
                inactiveTrackColor: Colors.transparent,
                inactiveThumbColor: Colors.grey,
                activeColor: Colors.white,
                activeTrackColor: Colors.green,
              ),
              onTap: () {},
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

class _Links extends StatelessWidget {
  const _Links({super.key});

  @override
  Widget build(BuildContext context) {
    final listStyle = BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(19, 158, 158, 158)
          : Colors.white,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: listStyle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Text('Ссылки', style: Theme.of(context).textTheme.titleSmall),
          ),
          ListTile(
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
          Divider(height: 0.1),
          ListTile(
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
          Divider(height: 0.1),
          ListTile(
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
        ],
      ),
    );
  }
}
