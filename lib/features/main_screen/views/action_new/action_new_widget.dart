import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

final boxDecoradion = BoxDecoration(
    color: const Color.fromARGB(33, 158, 158, 158),
    borderRadius: BorderRadius.circular(10));

class _ActionNewWidgetBody extends StatefulWidget {
  const _ActionNewWidgetBody();

  @override
  State<_ActionNewWidgetBody> createState() => _ActionNewWidgetBodyState();
}

class _ActionNewWidgetBodyState extends State<_ActionNewWidgetBody> {
  final List<bool> _dayTimeSelected = [true, false, false];

  Widget? _displayedWidget;
  bool _regularValue = false;
  int? _regularSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
        ),
        title: Text('Создать задачу',
            style: Theme.of(context).textTheme.labelLarge),
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
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Основное',
                          style: Theme.of(context).textTheme.titleMedium),
                      SizedBox(height: 10),
                      Container(
                        decoration: boxDecoradion,
                        child: TextFormField(
                          onChanged: (value) =>
                              ActionNewModelProvider.of(context)
                                  ?.model
                                  .groupName = value,
                          decoration: const InputDecoration(
                              labelText: 'Название',
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: boxDecoradion,
                        child: TextFormField(
                          onChanged: (value) =>
                              ActionNewModelProvider.of(context)
                                  ?.model
                                  .groupDesc = value,
                          decoration: const InputDecoration(
                              labelText: 'Описание',
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: boxDecoradion,
                        child: TextFormField(
                          onChanged: (value) =>
                              ActionNewModelProvider.of(context)
                                  ?.model
                                  .groupTarget = value,
                          decoration: const InputDecoration(
                              labelText: 'Цель',
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Прочее',
                          style: Theme.of(context).textTheme.titleMedium),
                      SizedBox(height: 10),
                      Container(
                        decoration: boxDecoradion,
                        child: TextFormField(
                          onChanged: (value) =>
                              ActionNewModelProvider.of(context)
                                  ?.model
                                  .groupCreateDate = value,
                          decoration: const InputDecoration(
                              labelText: 'Дата начала',
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16)),
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
                          if (index == 1) {
                            _displayedWidget = const _ButtonsDayTimesGroup();
                          } else if (index == 2) {
                            _displayedWidget =
                                const _ButtonsDayPartTimesGroup();
                          } else {
                            _displayedWidget = null;
                          }
                        },
                        color: Colors.black54,
                        selectedColor: Colors.black54,
                        borderRadius: BorderRadius.circular(15),
                        fillColor: const Color.fromARGB(50, 158, 158, 158),
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - 36) / 3,
                            child: Center(
                              child: Text(
                                'Весь день',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color.fromARGB(153, 255, 255, 255)
                                      : const Color.fromARGB(
                                          255, 109, 108, 108),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - 60) / 3,
                            child: Center(
                              child: Text(
                                'Часть дня',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color.fromARGB(153, 255, 255, 255)
                                      : const Color.fromARGB(
                                          255, 109, 108, 108),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - 36) / 3,
                            child: Center(
                              child: Text(
                                'Точный час',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color.fromARGB(153, 255, 255, 255)
                                      : const Color.fromARGB(
                                          255, 109, 108, 108),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_displayedWidget != null) ...[
                        SizedBox(height: 15),
                        _displayedWidget!
                      ],
                      SizedBox(height: 10),
                      ListTile(
                        title: Text(
                          'Регулярная задача',
                          style: TextStyle(fontSize: 17),
                        ),
                        trailing: Switch(
                          value: _regularValue,
                          onChanged: (v) {
                            ActionNewModelProvider.of(context)
                                ?.model
                                .groupRegular = true;
                            setState(() {
                              _regularValue = true;
                            });
                          },
                          inactiveTrackColor: Colors.transparent,
                          inactiveThumbColor: Colors.grey,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                        ),
                      ),
                      if (_regularValue == true) ...[
                        SizedBox(height: 10),
                        ListTile(
                          onTap: () {
                            setState(() {
                              _regularSelectedIndex = 0;
                            });
                            ActionNewModelProvider.of(context)
                                ?.model
                                .groupRegularType = 'Каждый день';
                          },
                          leading: SvgPicture.asset(
                            './assets/svg/Clock.svg',
                            height: 30,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color.fromARGB(153, 255, 255, 255)
                                    : Colors.black,
                          ),
                          title: Text('Каждый день'),
                          trailing: _regularSelectedIndex == 0
                              ? Icon(Icons.done)
                              : null,
                        ),
                        ListTile(
                          onTap: () {
                            setState(() {
                              _regularSelectedIndex = 1;
                            });
                            ActionNewModelProvider.of(context)
                                ?.model
                                .groupRegularType = 'По будням';
                          },
                          leading: SvgPicture.asset(
                            './assets/svg/Clock.svg',
                            height: 30,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color.fromARGB(153, 255, 255, 255)
                                    : Colors.black,
                          ),
                          title: Text('По будням'),
                          trailing: _regularSelectedIndex == 1
                              ? Icon(Icons.done)
                              : null,
                        ),
                      ]
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class _ButtonsDayTimesGroup extends StatefulWidget {
  const _ButtonsDayTimesGroup();

  @override
  State<_ButtonsDayTimesGroup> createState() => _ButtonsDayTimesGroupState();
}

class _ButtonsDayTimesGroupState extends State<_ButtonsDayTimesGroup> {
  final List<bool> _dayPartTimeSelected = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: _dayPartTimeSelected,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _dayPartTimeSelected.length; i++) {
            _dayPartTimeSelected[i] = i == index;
          }
        });
        if (index == 0) {
          ActionNewModelProvider.of(context)?.model.groupdayPart = 'Утро';
        } else if (index == 1) {
          ActionNewModelProvider.of(context)?.model.groupdayPart = 'День';
        } else if (index == 2) {
          ActionNewModelProvider.of(context)?.model.groupdayPart = 'Вечер';
        } else if (index == 3) {
          ActionNewModelProvider.of(context)?.model.groupdayPart = 'Ночь';
        } else {
          ActionNewModelProvider.of(context)?.model.groupdayPart = 'Весь день';
        }
      },
      color: Colors.black54,
      selectedColor: Colors.black54,
      borderRadius: BorderRadius.circular(15),
      fillColor: const Color.fromARGB(50, 158, 158, 158),
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width - 45) / 4,
          child: Column(
            children: [
              SvgPicture.asset(
                './assets/svg/morning.svg',
                height: 30,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(153, 255, 255, 255)
                    : Colors.black,
              ),
              Text(
                'Утро',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(153, 255, 255, 255)
                      : const Color.fromARGB(255, 109, 108, 108),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 45) / 4,
          child: Column(
            children: [
              SvgPicture.asset(
                './assets/svg/day.svg',
                height: 30,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(153, 255, 255, 255)
                    : Colors.black,
              ),
              Text(
                'День',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(153, 255, 255, 255)
                      : const Color.fromARGB(255, 109, 108, 108),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 45) / 4,
          child: Column(
            children: [
              SvgPicture.asset(
                './assets/svg/evening.svg',
                height: 30,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(153, 255, 255, 255)
                    : Colors.black,
              ),
              Text(
                'Вечер',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(153, 255, 255, 255)
                      : const Color.fromARGB(255, 109, 108, 108),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 45) / 4,
          child: Column(
            children: [
              SvgPicture.asset(
                './assets/svg/night.svg',
                height: 30,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(153, 255, 255, 255)
                    : Colors.black,
              ),
              Text(
                'Ночь',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(153, 255, 255, 255)
                      : const Color.fromARGB(255, 109, 108, 108),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ButtonsDayPartTimesGroup extends StatelessWidget {
  const _ButtonsDayPartTimesGroup();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoradion,
      child: TextFormField(
        onChanged: (value) =>
            ActionNewModelProvider.of(context)?.model.groupdayPart = value,
        decoration: const InputDecoration(
            labelText: 'Пример: 15:00',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16)),
      ),
    );
  }
}
