import 'package:flutter/material.dart';

import '../render_list_model.dart';

void showDeleteConfirmationDialog(BuildContext context, int indexInList) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(19, 158, 158, 158)
            : Colors.white,
        title: Text(
          'Подтверждение удаления',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text('Восстановить задачу после удаления будет невозможно.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              RenderListModelProvider.of(context)
                  ?.model
                  .deleteGroup(indexInList);
              Navigator.of(context).pop();
            },
            child: Text(
              'Удалить',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
