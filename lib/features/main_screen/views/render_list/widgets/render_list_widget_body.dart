import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../render_list_model.dart';
import 'render_list_row_widget.dart';

class RenderListWidgetBody extends StatefulWidget {
  const RenderListWidgetBody({super.key});

  @override
  State<RenderListWidgetBody> createState() => RenderListWidgetBodyState();
}

class RenderListWidgetBodyState extends State<RenderListWidgetBody> {
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
                  return RenderListRowWidget(indexInList: index);
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
