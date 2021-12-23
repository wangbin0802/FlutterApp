import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenAnimDemo extends StatefulWidget {
  const TweenAnimDemo({Key? key}) : super(key: key);

  @override
  _TweenAnimDemoState createState() => _TweenAnimDemoState();
}

class _TweenAnimDemoState extends State<TweenAnimDemo>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,
    duration: Duration(milliseconds: 500))
    ..addListener(() {
      setState(() {

      });
    });
    _animation = ColorTween(
      begin: Colors.blue,
      end: Colors.red
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _controller.forward(),
        child: Container(
          height: 100,
          width: 100,
          color: _animation.value,
          alignment: Alignment.center,
          child: Text(
            "点我变色",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
