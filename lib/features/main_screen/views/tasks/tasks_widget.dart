import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Task {
  String label;

  Task({required this.label});
}

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  final _tasks = [];

  @override
  Widget build(BuildContext context) {
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
                        FloatingActionButton.large(
                          onPressed: () {},
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
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
                          color: const Color.fromARGB(99, 158, 158, 158),
                          borderRadius: BorderRadius.circular(20)),
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
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final tasks = _tasks[index];
                  return ListTile(
                    tileColor: Colors.white,
                    leading: const Icon(Icons.folder_open_outlined),
                    title: Text(tasks.label,
                        style: const TextStyle(fontWeight: FontWeight.w400)),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  );
                },
              ),
            ],
          ),
          if (_tasks.isEmpty) ...[
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
                onPressed: () {
                  Navigator.of(context).pushNamed('/main/new_task');
                },
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
