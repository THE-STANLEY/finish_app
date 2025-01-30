import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myday/bloc/theme/theme_cubit.dart';
import 'package:myday/domain/repositories/settings/settings_repository.dart';
import 'package:myday/router/router.dart';
import 'package:myday/ui/ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
            theme: state.isDark ? darkTheme : lightTheme,
            initialRoute: '/main',
            routes: routes,
            navigatorObservers: [TalkerRouteObserver(Talker())],
          );
        },
      ),
    );
  }
}
