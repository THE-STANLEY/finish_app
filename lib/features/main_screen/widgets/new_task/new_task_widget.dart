import 'package:flutter/cupertino.dart';
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
        backgroundColor: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
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
                  child: TextFormField(
                    onChanged: (value) => NewTaskModelProvider.of(context)
                        ?.model
                        .taskText = value,
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
                  child: TextFormField(
                    enabled: false,
                    decoration: const InputDecoration(
                        labelText: 'Описание',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                  ),
                ),
                const SizedBox(height: 10),
                Text('Дата', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(33, 158, 158, 158),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    enabled: false,
                    decoration: const InputDecoration(
                        labelText: '14 ноября',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Задача на весь день',
                        style: Theme.of(context).textTheme.labelLarge),
                    const CupertinoSwitch(
                      value: false,
                      onChanged: null,
                      activeTrackColor: Colors.orange,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Регулярная задача',
                        style: Theme.of(context).textTheme.labelLarge),
                    const CupertinoSwitch(
                      value: false,
                      onChanged: null,
                      activeTrackColor: Colors.orange,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
