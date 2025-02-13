import '../../features/first_screen/first_screen.dart';
import '../../features/main_screen/main_screen.dart';
import '../../features/main_screen/views/views.dart';

final routes = {
  '/': (context) => const FirstScreenWidget(),
  '/main': (context) => const MainScreenWidget(),
  '/main/action_new': (context) => const ActionNewWidget(),
};
