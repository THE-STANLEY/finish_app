import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'groups_model.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({super.key});

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  final _model = GroupsModel();

  @override
  Widget build(BuildContext context) {
    return GroupsModelProvider(
      model: _model,
      child: _GroupsWidgetBody(),
    );
  }
}

class _GroupsWidgetBody extends StatefulWidget {
  const _GroupsWidgetBody();

  @override
  State<_GroupsWidgetBody> createState() => _GroupsWidgetBodyState();
}

class _GroupsWidgetBodyState extends State<_GroupsWidgetBody> {
  @override
  Widget build(BuildContext context) {
    final groupsCount =
        GroupsModelProvider.of(context)?.model.groups.length ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Папки', style: Theme.of(context).textTheme.titleMedium),
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
          Divider(height: 1),
          CustomScrollView(
            slivers: [
              SliverList.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                ),
                itemCount: groupsCount,
                itemBuilder: (context, index) {
                  return _GroupsRowWidget(indexInList: index);
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
                onPressed: () =>
                    GroupsModelProvider.of(context)?.model.showForm(context),
                icon: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _GroupsRowWidget extends StatelessWidget {
  final int indexInList;
  const _GroupsRowWidget({required this.indexInList});

  @override
  Widget build(BuildContext context) {
    final group = GroupsModelProvider.of(context)!.model.groups[indexInList];

    final listStyle = BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(19, 158, 158, 158)
          : Colors.white,
    );

    return Container(
      decoration: listStyle,
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                GroupsModelProvider.of(context)?.model.deleteGroup(indexInList);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Удалить',
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(Icons.folder_open_outlined),
          title: Text(group.name,
              style: const TextStyle(fontWeight: FontWeight.w400)),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
          onTap: () => GroupsModelProvider.of(context)
              ?.model
              .showTasks(context, indexInList),
        ),
      ),
    );
  }
}
