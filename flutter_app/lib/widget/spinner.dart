import 'dart:math';

import 'package:flutter/material.dart';

class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.green,
          child: const Center(
            child: Text('Wee'),
          ),
        ),
        animation: _controller,
        builder: (context, child) {
//          return Transform.rotate(angle: _controller.value * 2.0 * pi,
//              child: child,);
          return Transform.translate(
            offset: Offset(100, -200),
            child: child,
          );
        });
  }
}
