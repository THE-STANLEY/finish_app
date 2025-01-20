import '../features/main_screen/main_screen.dart';
import '../features/main_screen/widgets/new_group/new_group.dart';
import '../features/main_screen/widgets/new_task/new_task.dart';
import '../features/main_screen/widgets/tasks/tasks_widget.dart';

final routes = {
  '/main': (context) => const MainScreenWidget(),
  '/main/new_group': (context) => const NewGroupWidget(),
  '/main/tasks': (context) => const TasksWidget(),
  '/main/tasks/new_task': (context) => const NewTaskWidget(),
};
