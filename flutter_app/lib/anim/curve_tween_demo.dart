import 'package:flutter/material.dart';

class CurveTweenDemo extends StatefulWidget {
  const CurveTweenDemo({Key key}) : super(key: key);

  @override
  _CurveTweenDemoState createState() => _CurveTweenDemoState();
}

class _CurveTweenDemoState extends State<CurveTweenDemo> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500))
    ..addListener(() {
      setState(() {

      });
    });

    _animation = Tween(
      begin: 100.0,
      end: 200.0,
    ).chain(CurveTween(curve: Curves.linear))
    .animate(_controller);

    // _animation = _controller.drive(CurveTween(curve: Curves.linear)).drive(Tween(
    //   begin: 100.0,
    //   end: 200.0
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _controller.forward(),
        child: Container(
          height: _animation.value,
          width: _animation.value,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            "点我变大",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
