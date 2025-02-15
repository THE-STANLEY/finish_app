import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'render_list_model.dart';

class RenderListWidget extends StatefulWidget {
  const RenderListWidget({super.key});

  @override
  State<RenderListWidget> createState() => _RenderListWidgetState();
}

class _RenderListWidgetState extends State<RenderListWidget> {
  final _model = RenderListModel();

  @override
  Widget build(BuildContext context) {
    return RenderListModelProvider(
      model: _model,
      child: _RenderListWidgetBody(),
    );
  }
}

class _RenderListWidgetBody extends StatefulWidget {
  const _RenderListWidgetBody();

  @override
  State<_RenderListWidgetBody> createState() => _RenderListWidgetBodyState();
}

class _RenderListWidgetBodyState extends State<_RenderListWidgetBody> {
  @override
  Widget build(BuildContext context) {
    final groupsCount =
        RenderListModelProvider.of(context)?.model.groups.length ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Задачи', style: Theme.of(context).textTheme.titleLarge),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('d MMMM, yyyy', 'ru_RU').format(DateTime.now()),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  'Сегодня',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Divider(height: 0.1),
          CustomScrollView(
            slivers: [
              SliverList.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                ),
                itemCount: groupsCount,
                itemBuilder: (context, index) {
                  return _RenderListRowWidget(indexInList: index);
                },
              ),
            ],
          ),
          if (groupsCount == 0) ...[
            Center(
              child: SvgPicture.asset(
                './assets/svg/successful.svg',
                height: 70,
              ),
            )
          ],
          Positioned(
            right: 20,
            bottom: 20,
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () => RenderListModelProvider.of(context)
                    ?.model
                    .showForm(context),
                icon: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _RenderListRowWidget extends StatelessWidget {
  final int indexInList;
  const _RenderListRowWidget({required this.indexInList});

  @override
  Widget build(BuildContext context) {
    final group =
        RenderListModelProvider.of(context)!.model.groups[indexInList];

    final listStyle = BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(19, 158, 158, 158)
          : Colors.white,
    );

    final task = RenderListModelProvider.of(context)!.model.groups[indexInList];

    final icon = task.isDone
        ? SvgPicture.asset(
            './assets/svg/isDone.svg',
            height: 30,
          )
        : SvgPicture.asset(
            './assets/svg/Checkbox.svg',
            height: 30,
          );

    final isDoneStyle = TextStyle(decoration: TextDecoration.lineThrough);

    return Container(
      decoration: listStyle,
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (v) {},
              backgroundColor: Color.fromARGB(255, 241, 171, 39),
              foregroundColor: Colors.white,
              label: 'Закреп.',
            ),
            SlidableAction(
              onPressed: (BuildContext context) {
                RenderListModelProvider.of(context)
                    ?.model
                    .deleteGroup(indexInList);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              label: 'Удалить',
            ),
          ],
        ),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                group.dayPart,
                style: task.isDone
                    ? isDoneStyle
                    : Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                group.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: task.isDone
                    ? isDoneStyle
                    : const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          subtitle: Text(
            group.desc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: task.isDone
                ? isDoneStyle
                : Theme.of(context).textTheme.labelSmall,
          ),
          trailing: IconButton(
            onPressed: () {
              if (task.isDone) {
                null;
              } else {
                RenderListModelProvider.of(context)!
                    .model
                    .doneToggle(indexInList);
              }
            },
            icon: icon,
            iconSize: 30,
          ),
          onTap: () {
            final isDarkMode = Theme.of(context).brightness == Brightness.dark;
            showModalBottomSheet(
              backgroundColor: isDarkMode
                  ? const Color.fromARGB(255, 22, 21, 21)
                  : Colors.white,
              context: context,
              isScrollControlled: false,
              builder: (BuildContext context) {
                return SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close),
                            ),
                          ],
                        ),
                        Text(group.name,
                            style: Theme.of(context).textTheme.titleLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        SizedBox(height: 5),
                        if (group.desc.isNotEmpty) ...[
                          Text(
                            group.desc,
                            style: Theme.of(context).textTheme.labelLarge,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                        ],
                        if (group.target?.isNotEmpty ?? false) ...[
                          Text('${group.target}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelLarge),
                        ],
                        Row(
                          children: [
                            Text(
                              'Время:',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(width: 5),
                            Text(group.dayPart,
                                style: Theme.of(context).textTheme.labelLarge),
                          ],
                        ),
                        if (group.regularType?.isNotEmpty ?? false) ...[
                          Row(
                            children: [
                              Text(
                                'Регулярность:',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              SizedBox(width: 5),
                              Text('${group.regularType}',
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                            ],
                          ),
                        ],
                        if (group.date?.isNotEmpty ?? false) ...[
                          Row(
                            children: [
                              Text(
                                'Начата:',
                                style: Theme.of(context).textTheme.titleSmall,
                                maxLines: 1,
                              ),
                              SizedBox(width: 5),
                              Text('${group.date}',
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                            ],
                          ),
                        ],
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: FloatingActionButton(
                                onPressed: () {
                                  if (task.isDone) {
                                    null;
                                  } else {
                                    RenderListModelProvider.of(context)!
                                        .model
                                        .doneToggle(indexInList);
                                  }
                                },
                                backgroundColor: task.isDone
                                    ? const Color.fromARGB(255, 238, 174, 78)
                                    : Colors.orange,
                                child: Text(
                                  task.isDone ? 'Выполнено' : 'Выполнить',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: InkWell(
                            onTap: () {
                              RenderListModelProvider.of(context)
                                  ?.model
                                  .deleteGroup(indexInList);
                            },
                            child: Text(
                              'Удалить',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
