import 'package:flutter/material.dart';

import 'action_new_model.dart';

class ActionNewWidget extends StatefulWidget {
  const ActionNewWidget({super.key});

  @override
  State<ActionNewWidget> createState() => _ActionNewWidgetState();
}

class _ActionNewWidgetState extends State<ActionNewWidget> {
  final _model = ActionNewModel();

  @override
  Widget build(BuildContext context) {
    return ActionNewModelProvider(
      model: _model,
      child: _ActionNewWidgetBody(),
    );
  }
}

class _ActionNewWidgetBody extends StatelessWidget {
  const _ActionNewWidgetBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
        ),
        title: Text('Создать задачу',
            style: Theme.of(context).textTheme.titleSmall),
        actions: [
          InkWell(
            onTap: () {
              ActionNewModelProvider.of(context)?.model.saveGroup(context);
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
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(19, 158, 158, 158)
                : Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Основное', style: Theme.of(context).textTheme.titleSmall),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(33, 158, 158, 158),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    onChanged: (value) => ActionNewModelProvider.of(context)
                        ?.model
                        .groupName = value,
                    decoration: const InputDecoration(
                        labelText: 'Название',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(33, 158, 158, 158),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    onChanged: (v) {},
                    decoration: const InputDecoration(
                        labelText: 'Описание',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(33, 158, 158, 158),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    onChanged: (v) {},
                    decoration: const InputDecoration(
                        labelText: 'Конечный результат',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                  ),
                ),
                SizedBox(height: 10),
                Text('Папка', style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
