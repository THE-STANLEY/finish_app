import '../features/main_screen/main_screen.dart';
import '../features/main_screen/widgets/new_task/new_task.dart';

final routes = {
  '/main': (context) => const MainScreenWidget(),
  '/main/new_task': (context) => const NewTaskWidget(),
};
