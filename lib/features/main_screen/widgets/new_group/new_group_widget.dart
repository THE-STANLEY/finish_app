import 'package:flutter/material.dart';

import 'new_group_model.dart';

class NewGroupWidget extends StatefulWidget {
  const NewGroupWidget({super.key});

  @override
  State<NewGroupWidget> createState() => _NewGroupWidgetState();
}

class _NewGroupWidgetState extends State<NewGroupWidget> {
  final _model = NewGroupModel();

  @override
  Widget build(BuildContext context) {
    return NewGroupModelProvider(
      model: _model,
      child: _NewGroupWidgetBody(),
    );
  }
}

class _NewGroupWidgetBody extends StatelessWidget {
  const _NewGroupWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.orange,
          size: 30,
        ),
        title: Text('Создать папку',
            style: Theme.of(context).textTheme.titleSmall),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              NewGroupModelProvider.of(context)?.model.saveGroup(context);
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
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
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
                    onChanged: (value) => NewGroupModelProvider.of(context)
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
