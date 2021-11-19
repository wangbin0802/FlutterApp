import 'package:flutter/cupertino.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final WidgetBuilder contentBuilder;
  final double width;
  final bool showCheckedBox;
  final bool disable;
  BuildContext context;
  final String saveKey;

  ConfirmDialog({Key key, this.title, this.content,
    this.contentBuilder, this.saveKey, this.width,
    this.showCheckedBox, this.disable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
