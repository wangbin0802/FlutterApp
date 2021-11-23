import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedWidgetTest extends StatefulWidget {
  const AnimatedWidgetTest({Key key}) : super(key: key);

  @override
  _AnimatedWidgetTestState createState() => _AnimatedWidgetTestState();
}

class _AnimatedWidgetTestState extends State<AnimatedWidgetTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 5);
    return SingleChildScrollView(
      child: Column(
        children: [
          RaisedButton(
            onPressed: () {
              setState(
                () {
                  _padding = 20;
                },
              );
            },
            child: AnimatedPadding(
              duration: duration,
              padding: EdgeInsets.all(_padding),
              child: Text("AnimatedPadding"),
            ),
          ),
        ],
      ),
    );
  }
}
