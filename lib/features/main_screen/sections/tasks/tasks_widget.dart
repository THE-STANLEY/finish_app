import 'package:flutter/material.dart';

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
  final _tasks = [
    Task(label: 'Выкинуть мусор'),
    Task(label: 'Купить хлеб'),
  ];

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
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Задачи',
                        style: Theme.of(context).textTheme.titleMedium),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
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
              SliverList.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final tasks = _tasks[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      color: Colors.white,
                      child: ListTile(
                        // leading: const Icon(Icons.folder_open_outlined),
                        title: Text(tasks.label,
                            style:
                                const TextStyle(fontWeight: FontWeight.w400)),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 25,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/main/new_task');
              },
              backgroundColor: Colors.purple,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
