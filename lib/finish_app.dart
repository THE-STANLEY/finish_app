import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/bloc/theme/theme_cubit.dart';
import 'core/domain/repositories/settings/settings.dart';
import 'core/router/router.dart';
import 'core/ui/theme/theme.dart';

class MyDayApp extends StatelessWidget {
  const MyDayApp({super.key, required this.preferences});

  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    final settingsRepository = SettingsRepository(preferences: preferences);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                ThemeCubit(settingsRepository: settingsRepository)),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            locale: Locale('ru', 'RU'), // Устанавливаем локаль
            supportedLocales: [
              Locale('en', 'US'),
              Locale('ru', 'RU'),
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: state.isDark ? darkTheme : lightTheme,
            initialRoute: '/',
            routes: routes,
            navigatorObservers: [TalkerRouteObserver(Talker())],
          );
        },
      ),
    );
  }
}
