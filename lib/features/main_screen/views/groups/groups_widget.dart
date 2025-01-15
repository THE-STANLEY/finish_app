import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  const _GroupsWidgetBody({super.key});

  @override
  State<_GroupsWidgetBody> createState() => _GroupsWidgetBodyState();
}

class _GroupsWidgetBodyState extends State<_GroupsWidgetBody> {
  bool _isEditing = false;
  bool _showCreateButton = false;

  @override
  Widget build(BuildContext context) {
    final groupsCount =
        GroupsModelProvider.of(context)?.model.groups.length ?? 0;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                centerTitle: true,
                backgroundColor: Colors.white,
                title: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Задачи',
                            style: Theme.of(context).textTheme.titleMedium),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isEditing = !_isEditing;
                              _showCreateButton = !_showCreateButton;
                            });
                          },
                          child: Text(
                            _isEditing ? 'Применить' : 'Изменить',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        )
                      ],
                    ),
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
                          color: const Color.fromARGB(33, 158, 158, 158),
                          borderRadius: BorderRadius.circular(10)),
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
          if (_showCreateButton)
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 90,
              bottom: 20,
              child: FloatingActionButton.extended(
                heroTag: 'push_next_screen_button',
                onPressed: () =>
                    GroupsModelProvider.of(context)?.model.showForm(context),
                backgroundColor: Colors.orange,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Создать папку',
                  style: TextStyle(color: Colors.white),
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
  const _GroupsRowWidget({super.key, required this.indexInList});

  @override
  Widget build(BuildContext context) {
    final group = GroupsModelProvider.of(context)!.model.groups[indexInList];

    return Slidable(
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
        tileColor: Colors.white,
        title: Text(group.name,
            style: const TextStyle(fontWeight: FontWeight.w400)),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
