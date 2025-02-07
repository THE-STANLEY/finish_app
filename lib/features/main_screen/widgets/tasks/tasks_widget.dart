import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'tasks_model.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  TasksModel? _model;

  @override
  void didChangeDependencies() {
    if (_model == null) {
      final groupKey = ModalRoute.of(context)!.settings.arguments
          as int; // Получаем groupKey
      super.didChangeDependencies();
      _model = TasksModel(groupKey: groupKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = _model;

    if (model != null) {
      return TasksModelProvider(model: model, child: _TasksWidgetBody());
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}

class _TasksWidgetBody extends StatelessWidget {
  const _TasksWidgetBody();

  @override
  Widget build(BuildContext context) {
    final model = TasksModelProvider.of(context)!.model;
    final title = model.group?.name ?? 'Задачи';
    final tasksCount = TasksModelProvider.of(context)?.model.tasks.length ?? 0;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.orange,
          size: 30,
        ),
        title: Text(title, style: Theme.of(context).textTheme.titleSmall),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromARGB(19, 158, 158, 158)
              : const Color.fromRGBO(255, 255, 255, 0.702),
        ),
        child: Stack(
          children: [
            ListView.separated(
              separatorBuilder: (context, index) => Divider(height: 1),
              itemCount: tasksCount,
              itemBuilder: (context, index) {
                return _TaskWrapper(indexInList: index);
              },
            ),
            Positioned(
              right: 20,
              bottom: 40,
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: () =>
                      TasksModelProvider.of(context)?.model.showForm(context),
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TaskWrapper extends StatelessWidget {
  final int indexInList;
  const _TaskWrapper({required this.indexInList});

  @override
  Widget build(BuildContext context) {
    final listStyle = BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(19, 158, 158, 158)
          : Colors.white,
    );

    final model = TasksModelProvider.of(context)!.model;
    final task = model.tasks[indexInList];

    final styleName = task.isDone
        ? const TextStyle(
            fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough)
        : const TextStyle(fontWeight: FontWeight.w600);

    final styleDesc = task.isDone
        ? const TextStyle(
            fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough)
        : const TextStyle(fontWeight: FontWeight.w400);
    final icon = task.isDone ? Icons.done : null;
    return Container(
      decoration: listStyle,
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                TasksModelProvider.of(context)?.model.deleteTask(indexInList);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Удалить',
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(Icons.task),
          title: Text(task.text, style: styleName),
          subtitle: Text(task.description, style: styleDesc),
          trailing: Icon(icon),
          onTap: () {
            TasksModelProvider.of(context)?.model.doneToggle(indexInList);
          },
        ),
      ),
    );
  }
}
