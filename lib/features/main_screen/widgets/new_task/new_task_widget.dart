import 'package:flutter/material.dart';

import 'new_task_model.dart';

class NewTaskWidget extends StatefulWidget {
  const NewTaskWidget({super.key});

  @override
  State<NewTaskWidget> createState() => _NewTaskWidgetState();
}

class _NewTaskWidgetState extends State<NewTaskWidget> {
  NewTaskModel? _model;

  @override
  void didChangeDependencies() {
    if (_model == null) {
      final groupKey = ModalRoute.of(context)!.settings.arguments
          as int; // Получаем groupKey
      super.didChangeDependencies();
      _model = NewTaskModel(groupKey: groupKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NewTaskModelProvider(
      model: _model!,
      child: _NewTaskWidgetBody(),
    );
  }
}

class _NewTaskWidgetBody extends StatelessWidget {
  const _NewTaskWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.orange,
          size: 30,
        ),
        title: Text('Создать задачу',
            style: Theme.of(context).textTheme.titleSmall),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              NewTaskModelProvider.of(context)?.model.saveTask(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text('Сохранить',
                  style: Theme.of(context).textTheme.labelMedium),
            ),
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(19, 158, 158, 158)
            : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Основное', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(33, 158, 158, 158),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  maxLines: 1,
                  onChanged: (value) =>
                      NewTaskModelProvider.of(context)?.model.taskText = value,
                  decoration: const InputDecoration(
                      labelText: 'Название',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(33, 158, 158, 158),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  minLines: 1,
                  maxLines: 10,
                  onChanged: (value) => NewTaskModelProvider.of(context)
                      ?.model
                      .taskDescription = value,
                  decoration: const InputDecoration(
                      labelText: 'Описание',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
