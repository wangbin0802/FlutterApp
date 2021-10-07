import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BlueBox(),
        Flexible(child: BlueBox(),
        flex: 1,
        fit: FlexFit.tight,),
        BlueBox()],
    );
  }
}

class BlueBox extends StatelessWidget {
  const BlueBox({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: Colors.blue, border: Border.all()),
    );
  }
}
