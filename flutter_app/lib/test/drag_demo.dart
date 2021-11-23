import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DragDemo extends StatefulWidget {
  const DragDemo({Key key}) : super(key: key);

  @override
  _DragDemoState createState() => _DragDemoState();
}

class _DragDemoState extends State<DragDemo> with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onScaleUpdate: (ScaleUpdateDetails details) {
                _width = 200 * details.scale.clamp(.8, 10.0);
              },
              child: Container(
                width: _width,
                child: CircleAvatar(
                  child: Text("A"),
                ),
              ),
              onPanDown: (DragDownDetails e) {
                print("用户手指按下:${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails s) {
                setState(() {
                  _left += s.delta.dx;
                  _top += s.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },
            ))
      ],
    );
  }
}
