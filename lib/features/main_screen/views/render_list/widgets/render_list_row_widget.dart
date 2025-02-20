import 'package:finish/core/domain/entity/group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../render_list_model.dart';

class RenderListRowWidget extends StatelessWidget {
  final int indexInList;
  const RenderListRowWidget({super.key, required this.indexInList});

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
          _showModalBottomSheet(isDarkMode, context, group, task);
        },
      ),
    );
  }

  Future<dynamic> _showModalBottomSheet(
      bool isDarkMode, BuildContext context, Group group, Group task) {
    return showModalBottomSheet(
      backgroundColor:
          isDarkMode ? const Color.fromARGB(255, 22, 21, 21) : Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
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
                SizedBox(height: 5.h),
                if (group.desc.isNotEmpty) ...[
                  Text(
                    group.desc,
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
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
                      'Время',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(width: 5.w),
                    Text(group.dayPart,
                        style: Theme.of(context).textTheme.labelLarge),
                  ],
                ),
                if (group.regularType?.isNotEmpty ?? false) ...[
                  Row(
                    children: [
                      Text(
                        'Регулярность',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(width: 5.w),
                      Text('${group.regularType}',
                          style: Theme.of(context).textTheme.labelLarge),
                    ],
                  ),
                ],
                if (group.date?.isNotEmpty ?? false) ...[
                  Row(
                    children: [
                      Text(
                        'Начато',
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 1,
                      ),
                      SizedBox(width: 5.w),
                      Text('${group.date}',
                          style: Theme.of(context).textTheme.labelLarge),
                    ],
                  ),
                ],
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: FloatingActionButton(
                        onPressed: () {
                          if (task.isDone) {
                            null;
                          } else {
                            RenderListModelProvider.of(context)
                                ?.model
                                .doneToggle(indexInList);
                          }
                        },
                        backgroundColor: task.isDone
                            ? const Color.fromARGB(255, 238, 174, 78)
                            : Colors.orange,
                        child: Text(
                          task.isDone ? 'Выполнено' : 'Выполнить',
                          style: TextStyle(
                              fontSize: 19.sp,
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
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
