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

class _ActionNewWidgetBody extends StatefulWidget {
  const _ActionNewWidgetBody();

  @override
  State<_ActionNewWidgetBody> createState() => _ActionNewWidgetBodyState();
}

class _ActionNewWidgetBodyState extends State<_ActionNewWidgetBody> {
  final List<bool> _dayTimeSelected = [true, false, false];

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
                    onChanged: (value) => ActionNewModelProvider.of(context)
                        ?.model
                        .groupDesc = value,
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
                    onChanged: (value) => ActionNewModelProvider.of(context)
                        ?.model
                        .groupTarget = value,
                    decoration: const InputDecoration(
                        labelText: 'Цель',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                  ),
                ),
                SizedBox(height: 10),
                Text('Прочее', style: Theme.of(context).textTheme.titleSmall),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(33, 158, 158, 158),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Дата начала',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                  ),
                ),
                SizedBox(height: 15),
                ToggleButtons(
                  isSelected: _dayTimeSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _dayTimeSelected.length; i++) {
                        _dayTimeSelected[i] = i == index;
                      }
                    });
                  },
                  color: Colors.black54,
                  selectedColor: Colors.black54,
                  borderRadius: BorderRadius.circular(15),
                  fillColor: const Color.fromARGB(50, 158, 158, 158),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Text(
                        'Весь день',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Text(
                        'Часть дня',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Text(
                        'Точный час',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ListTile(
                  title: Text(
                    'Регулярная задача',
                    style: TextStyle(fontSize: 17),
                  ),
                  trailing: Switch(
                    value: false,
                    onChanged: (v) {},
                    inactiveTrackColor: Colors.transparent,
                    inactiveThumbColor: Colors.grey,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
