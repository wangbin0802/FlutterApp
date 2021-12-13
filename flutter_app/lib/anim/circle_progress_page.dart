import 'package:flutter/material.dart';

import 'circle_progress_view.dart';

class CircleProgressPage extends StatefulWidget {
  const CircleProgressPage({Key key}) : super(key: key);

  @override
  _CircleProgressPageState createState() => _CircleProgressPageState();
}

class _CircleProgressPageState extends State<CircleProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 150,
          width: 150,
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 3),
            builder: (context, value, child) => CustomPaint(
              painter: CircleProgressPainter(value),
              child: Center(
                child: Text("${(value * 100).floor()}%"),
              ),
            ),
          )),
    );
  }
}
