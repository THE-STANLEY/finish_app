import 'package:myday/features/loading_screen/view.dart';
import 'package:myday/features/main_screen/main_screen_widget.dart';
import 'package:myday/features/main_screen/sections/create_task/create_task_widget.dart';

final routes = {
  '/': (context) => const LoadingScreenWidget(),
  '/main': (context) => const MainScreenWidget(),
  '/main/new_task': (context) => const CreateTaskWidget(),
};
