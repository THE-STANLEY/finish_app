import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myday/bloc/theme/theme_cubit.dart';
import 'package:myday/router/router.dart';
import 'package:myday/ui/ui.dart';
import 'package:talker_flutter/talker_flutter.dart';

class MyDayApp extends StatelessWidget {
  const MyDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
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
