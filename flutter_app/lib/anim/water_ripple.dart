import 'package:flutter/material.dart';
import 'package:flutter_app/anim/water_ripple_view.dart';

class WaterRipple extends StatefulWidget {
  final int count;
  final Color color;

  const WaterRipple({Key key, this.count, this.color}) : super(key: key);

  @override
  _WaterRippleState createState() => _WaterRippleState();
}

class _WaterRippleState extends State<WaterRipple> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
      ..addListener(() {
        // print(_controller.value);
      })
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => CustomPaint(
              painter: WaterRipplePainter(_controller.value, widget.count, widget.color),
            ));
  }
}
