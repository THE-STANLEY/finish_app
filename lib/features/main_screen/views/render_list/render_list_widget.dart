import 'package:flutter/material.dart';

import './widgets/render_list_widget_body.dart';
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
      child: RenderListWidgetBody(),
    );
  }
}
