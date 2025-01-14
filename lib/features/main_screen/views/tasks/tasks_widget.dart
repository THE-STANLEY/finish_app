import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'tasks_model.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  final _model = TasksModel();

  @override
  Widget build(BuildContext context) {
    return TasksModelProvider(
      model: _model,
      child: _TasksWidgetBody(),
    );
  }
}

class _TasksWidgetBody extends StatelessWidget {
  const _TasksWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksCount = TasksModelProvider.of(context)?.model.tasks.length ?? 0;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                centerTitle: true,
                backgroundColor: Colors.white,
                title: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Задачи',
                            style: Theme.of(context).textTheme.titleMedium),
                        InkWell(
                          onTap: () {},
                          child: Text('Изменить',
                              style: Theme.of(context).textTheme.labelMedium),
                        )
                      ],
                    ),
                  ],
                ),
                snap: true,
                floating: true,
                surfaceTintColor: Colors.transparent,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(80),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(33, 158, 158, 158),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            labelText: 'Поиск в задачах',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                ),
                itemCount: tasksCount,
                itemBuilder: (context, index) {
                  return _TasksRowWidget(indexInList: index);
                },
              ),
            ],
          ),
          if (tasksCount == 0) ...[
            Center(
              child: SvgPicture.asset(
                './assets/svg/successful.svg',
                height: 70,
              ),
            )
          ],
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 60,
            bottom: 20,
            child: FloatingActionButton.extended(
                heroTag: 'push_next_screen_button',
                onPressed: () =>
                    TasksModelProvider.of(context)?.model.showForm(context),
                backgroundColor: Colors.orange,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Создать',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}

class _TasksRowWidget extends StatelessWidget {
  final int indexInList;
  const _TasksRowWidget({super.key, required this.indexInList});

  @override
  Widget build(BuildContext context) {
    final task = TasksModelProvider.of(context)!.model.tasks[indexInList];

    return Slidable(
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
        tileColor: Colors.white,
        title: Text(task.name,
            style: const TextStyle(fontWeight: FontWeight.w400)),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
